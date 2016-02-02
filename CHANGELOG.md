Version 0.13 (unreleased)
------------


Version 0.12
------------

- [Enh]     Code cleaning: created solid base for more cli arguments
- [Enh]     Cron mode (--cron) (Silenced cron mode: no debug, only warnings and errors)
- [Enh]     Test mode (--test)
- [Enh]     Help screen (--help)
- [Enh]     Version screen (--version)
- [Enh]     Adjusted documentation


Version 0.11.3
--------------

- [Fix]		Try to create logfile directory if it does not exist


Version 0.11.2
--------------

- [Fix]		make install: Add directories if they don't exist


Version 0.11.1
--------------

- [Fix]		./configure: ignore missing runtime requirements


Version 0.11
------------

- [Fix]		make uninstall: Also remove *.new files
- [Enh]		Prefix path for installation
- [Enh]		./configure && make && make install routine
- [Enh]		Variable name refactoring
- [Enh]		Added encryption performance documentation
- [Enh]		Added compression performance documentation
- [Enh]		Added xz default preset


Version 0.10
------------

- [Enh]		More documentation about compression
- [Enh]		Added pbzip2 as a much faster pre-configured compression algorithm


Version 0.9
-----------

- [Enh]		Added .editorconfig to the project
- [Fix]		Documentation: dos file types changed to unix
- [Fix]		Install in /usr/local/bin instead of /usr/local/sbin
- [Enh]		Keep original filename after decryption (https://github.com/Paike)
- [Enh]		Make compression algorithm dynamic (thanks to @Paike)


Version 0.8
-----------

- [Enh]		Plugin update
- [Enh]		Documentation
- [Enh]		Makefile adjustments


Version 0.7
-----------

- [Enh]		Better default dump options
- [Enh]		Pass shellcheck


Version 0.6
-----------

- [Enh]		#11 Added choice to use either tmpwatch (redhat/centos/fedora) or tmpreaper (ubuntu/debian)
- [Bug]		#12 Remove files even if EUID doesn’t have write access (have config option for that to enable)


Version 0.5.1
-----------

- [Enh]		Improved Nagios Long output


Version 0.5
-----------

- [Bug]		Do not overwrite configuration files during re-/install
- [Enh]		Tied submodule check_mysqldump-secure to 0.5


Version 0.4
-----------

- [Bug]		Fixed bug when adding up two non integers (time and size)
- [Bug]		Fixed bug when using compression AND encryption together
- [Enh]		Display total Size and total Megabytes at the end
- [Enh]		Adjustable file/folder permission for target dir and db dumps
- [Enh]		List of required databases
- [Enh]		Added evil/bad mysqldump option blacklist


Version 0.3
-----------

- [Enh]		Added Nagios Plugin submodule
- [Enh]		Added Nagios Configuration Options


Version 0.2
-----------

- [Fix]		Added full POSIX compatibility
- [Enh]		Show database size while dumping
- [Enh]		Added installation via composer


Version 0.1
-----------

- [Fix]		Added full POSIX compatibility
- [Enh]		Show database size while dumping

