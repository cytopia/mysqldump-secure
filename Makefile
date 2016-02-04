# Unix Makefile

# Local files
DUMP_SH   = mysqldump-secure
DUMP_CONF = mysqldump-secure.conf
DUMP_CNF  = mysqldump-secure.cnf
MAN_PAGE  = mysqldump-secure.1

# Configuration
SHELL = /bin/sh

MKDIR_P = mkdir -p

# Check if './configure' has been run
ifneq ("$(wildcard configure.in)","")
CONFIGURED = 1
include configure.in
else
CONFIGURED = 0
endif

# Check if 'make' has been run
ifneq ("$(wildcard Makefile.in)","")
MAKED = 1
else
MAKED = 0
endif

# Check if any file is already installed
ifneq ("$(wildcard $(ETCDIR)/$(DUMP_CONF))","")
INSTALLED = 1
endif
ifneq ("$(wildcard $(ETCDIR)/$(DUMP_CNF))","")
INSTALLED = 1
endif
ifneq ("$(wildcard $(BINDIR)/$(DUMP_SH))","")
INSTALLED = 1
endif
ifneq ("$(wildcard $(MANDIR)/$(MAN_PAGE))","")
INSTALLED = 1
endif


all:

ifeq ($(CONFIGURED),0)
$(error Not configured, run ./configure)
endif

	@touch Makefile.in

	@echo "finished."
	@echo "Type 'make install' or 'make reinstall'"


help:
	@echo Options
	@echo "   make install"
	@echo "      Install everthing (might require root)"
	@echo ""
	@echo "   make reinstall"
	@echo "      Install everthing even if it is already"
	@echo "      installed (might require root)"
	@echo ""
	@echo "   make uninstall"
	@echo "      Remove everything except the logfiles"
	@echo "      (might require root)"
	@echo ""
	@echo "   make clean"
	@echo "      Clean build"
	@echo ""
	@echo "   make help"
	@echo "      Show this help screen"


install:

ifeq ($(MAKED),0)
	$(error Run 'make' first or show help: 'make help')
endif

ifeq ($(INSTALLED),1)
	$(error Already installed, use make reinstall)
endif

	@echo "Installing files"
	@echo ""

	@# Create directories
	${MKDIR_P} $(BINDIR)
	${MKDIR_P} $(ETCDIR)
	${MKDIR_P} $(MANDIR)/man1

	@# Install binary
	install -m 0644 build/$(DUMP_SH) $(BINDIR)/$(DUMP_SH)

	@# Install config file and create backup if there is one already
	install -b -m 0400 build/$(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF)

	@# Install config file and create backup if there is one already
	install -b -m 0400 build/$(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF)
	@echo ""

	@# Install man pages
	install -b -m 0644 build/$(MAN_PAGE) $(MANDIR)/man1/$(MAN_PAGE)
	@echo ""

	@echo "Installation complete:"
	@echo "    $(BINDIR)/$(DUMP_SH)"
	@echo "    $(ETCDIR)/$(DUMP_CONF)"
	@echo "    $(ETCDIR)/$(DUMP_CNF)"
	@echo "    $(MANDIR)/$(MAN_PAGE)"
	@echo ""
	@echo "----------------------------------------------------------------------"
	@echo "Note:"
	@echo ""
	@echo "Adjust values in $(ETCDIR)/$(DUMP_CONF)"
	@echo "Adjust values in $(ETCDIR)/$(DUMP_CNF)"
	@echo "----------------------------------------------------------------------"
	@echo ""


reinstall:

ifeq ($(MAKED),0)
	$(error Type 'make' first)
endif

	@echo "Installing files"
	@echo ""

	@# Create directories
	${MKDIR_P} $(BINDIR)
	${MKDIR_P} $(ETCDIR)
	${MKDIR_P} $(MANDIR)/man1

	@# Install binary
	install -m 0755 build/$(DUMP_SH) $(BINDIR)/$(DUMP_SH)
	@echo ""

	@# Install config file without overwriting
	test -f $(ETCDIR)/$(DUMP_CONF) \
		&& install -m 0400 build/$(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF).new \
		|| install -m 0400 build/$(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF)

	@echo ""

	@# Install config file without overwriting
	test -f $(ETCDIR)/$(DUMP_CNF) \
		&& install -m 0400 build/$(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF).new \
		|| install -m 0400 build/$(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF)
	@echo ""

	@# Install man pages
	install -b -m 0644 build/$(MAN_PAGE) $(MANDIR)/man1/$(MAN_PAGE)
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
	rm -f $(BINDIR)/$(DUMP_SH)
	rm -f $(ETCDIR)/$(DUMP_CONF)
	rm -f $(ETCDIR)/$(DUMP_CNF)
	rm -f $(ETCDIR)/$(DUMP_CONF).new
	rm -f $(ETCDIR)/$(DUMP_CNF).new
	rm -f $(MANDIR)/man1/$(MAN_PAGE)



clean:

	rm -rf build/*
	rm -f configure.in
	rm -f Makefile.in
