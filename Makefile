# Unix Makefile

# Local files
DUMP_SH   = mysqldump-secure
DUMP_CONF = mysqldump-secure.conf
DUMP_CNF  = mysqldump-secure.cnf

# System directories
PREFIX  = $(DESTDIR)/usr/local
SBINDIR = $(PREFIX)/sbin
ETCDIR  = /etc

# Configuration
SHELL = /bin/sh


# Check if any file is already installed
ifneq ("$(wildcard $(ETCDIR)/$(DUMP_CONF))","")
	INSTALLED = 1
endif
ifneq ("$(wildcard $(ETCDIR)/$(DUMP_CNF))","")
	INSTALLED = 1
endif
ifneq ("$(wildcard $(SBINDIR)/$(DUMP_SH))","")
	INSTALLED = 1
endif


all:
	@echo "Nothing to make."
	@echo "Type 'Make help' or one of the below options."
	@echo ""
	@echo Options
	@echo "   make install"
	@echo "   make reinstall"
	@echo "   make uninstall"
	@echo "   make help"


help:
	@echo Options
	@echo "   make install"
	@echo "      Install everthing (requires root)"
	@echo ""
	@echo "   make reinstall"
	@echo "      Install everthing even if it is already"
	@echo "      installed (requires root)"
	@echo ""
	@echo "   make uninstall"
	@echo "      Remove everything except the logfiles"
	@echo "      (requires root)"
	@echo ""
	@echo "   make help"
	@echo "      Show this help screen"


install:

ifeq ($(INSTALLED),1)
	$(error Already installed, use make reinstall)
endif

	@echo "Installing files"
	@echo ""

	@# Install binary
	install -m 0755 bin/$(DUMP_SH) $(SBINDIR)/$(DUMP_SH)
	@echo ""

	@# Install config file and create backup if there is one already
	install -b -m 0400 config/$(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF)
	@echo ""

	@# Install config file and create backup if there is one already
	install -b -m 0400 config/$(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF)
	@echo ""

	@echo "Installation complete"
	@echo ""
	@echo "Adjust values in $(ETCDIR)/$(DUMP_CONF)"
	@echo "Adjust values in $(ETCDIR)/$(DUMP_CNF)"


reinstall:

	@echo "Installing files"
	@echo ""

	@# Install binary
	install -m 0755 bin/$(DUMP_SH) $(SBINDIR)/$(DUMP_SH)
	@echo ""

	@# Install config file without overwriting
	test -f $(ETCDIR)/$(DUMP_CONF) \
		&& install -m 0400 config/$(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF).new \
		|| install -m 0400 config/$(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF)

	@echo ""

	@# Install config file without overwriting
	test -f $(ETCDIR)/$(DUMP_CNF) \
		&& install -m 0400 config/$(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF).new \
		|| install -m 0400 config/$(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF)
	@echo ""

	@echo "Installation complete"
	@echo ""
	@echo "Compare new config: $(ETCDIR)/$(DUMP_CONF).new"
	@echo "Compare new config: $(ETCDIR)/$(DUMP_CNF).new"
	@echo "New configuration options might be available"



uninstall:

	@# Never ever delete the public private keys!!
	@# Also keep the logfile, as we do not know its location (it is set in config)
	@# Just remove the binary and config files
	rm -f $(SBINDIR)/$(DUMP_SH)
	rm -f $(ETCDIR)/$(DUMP_CONF)
	rm -f $(ETCDIR)/$(DUMP_CNF)

