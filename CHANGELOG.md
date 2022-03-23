Version 0.17 (unreleased)
------------


Version 0.16.5
--------------

- [Fix]     Ensure `PATH` variable is set to survive cron runs


Version 0.16.4
--------------

- [Fix]     `empty` keyword is reserved in MySQL 8+


Version 0.16.3
--------------

- [Fix]     Changed SMIME size threshold from 12MB to 1200MB


Version 0.16.2
--------------

- [Fix]     Warn about SMIME bug if db size > 1200MB (https://github.com/cytopia/mysqldump-secure/issues/21)


Version 0.16.1
--------------

- [Enh]     Code refactoring
- [Enh]     Removed tput coloring (making it work under FreeBSD)
- [Enh]     Removed table list, as it was to slow with db: >1000 tables
- [Fix]     Fixed bug on systems with locales that use commas for floats
- [Fix]     Fixed configure to not stop when target directory does not exist


Version 0.16
------------

- [Fix]     Show pipefail-emulation errors and warnings (now works as expected)
- [Fix]     Using `--defaults-file` instead of `--defaults-extra-file` to make sure no unwanted options are loaded.
- [Fix]     Wrong "finished with errors" on `tmpwatch` readonly files
- [Fix]     Exception Handling: Handle all unbound variables
- [Fix]     Catch error in case of wrong values in all 0/1 variables
- [Fix]     Catch `tmpwatch`/`tmpreaper` errors and show warn/err accordingly
- [Fix]     `tmpreaper`/`tmpwatch` values now accept/validate units (m, h, d)
- [Fix]     Output: stdout did not show all deleted files by tmpwatch/tmpreaper
- [Fix]     Testing: Validate MYSQL_OPTS
- [Enh]     Adding info files for each dump file (optionally).
- [Enh]     Logleves for logging to file (0-3)
- [Enh]     Adding info: Show SSL cyphers in use by server (If SSL is enabled)
- [Enh]     Adding info: Show if Server is master or slave
- [Enh]     Adding info: Show server name and version
- [Enh]     Adding info: Show current connection IP/Port or socket
- [Enh]     Improving Logic: Allow $REQUIRE to overwrite $IGNORE
- [Enh]     Improving Option: Allowing wildcards for ignored databases (e.g: IGNORE="*")
- [Enh]     Adding option: Conditional `--quick` dependent on database size
- [Enh]     Adding option: Consistend DB dumps (InnoDB, mixed, other)
- [Enh]     Adding option: SSL Connection
- [Enh]     Adding argument: --verbose argument
- [Enh]     Testing: Adding lots and lots of travis checks.
- [Enh]     Making /tmp folder settable via config
- [Enh]     Output: New debug level: trace
- [Enh]     Output: Colorized logging
- [Enh]     Output: Consolidate logging
- [Enh]     Script: Use #!/bin/sh -u to check against unset variables
- [Enh]     Removed ${_INSTALL_PREFIX} from config file


Version 0.15
------------

- [Fix]     Exception Handling: Show error when file already exists on disk
- [Fix]     Fixed failed count and total dumped count
- [Fix]     [install] Fixed script install permissions
- [Fix]     [Nagios plugin] Submodule udpated
- [Enh]     [conf] Allow to specify custom config via argument
- [Enh]     Cleaned debug output


Version 0.14.1
--------------

- [Fix]     [install] Create man dir if not exists


Version 0.14
------------

- [Fix]     Do not silently ignore empty databases, show that they were skipped with reason.
- [Enh]     Add man page: man 1 mysqldump-secure
- [Enh]     Improved install routine


Version 0.13
------------

- [Fix]     #17 [sec] chmod is done after dumping to disk (now using umask before)
- [Fix]     #16 allow 0700 chmod formats as well as 700
- [Enh]     Added documentation about security measurements
- [Enh]     Improved code readability of integrity checks
- [Enh]     Auto-fix Nagios Log chmod permissions.
- [Enh]     Add chmod setting for Nagios Log in config.
- [Enh]     Added compression preset: pigz


Version 0.12
------------

- [Fix]     Now properly reports whether nagios plugin log is enabled/disabled
- [Enh]     Code cleaning: created solid base for more cli arguments
- [Enh]     Cron mode (--cron) (Silenced cron mode: no debug, only warnings and errors)
- [Enh]     Test mode (--test)
- [Enh]     Help screen (--help)
- [Enh]     Version screen (--version)
- [Enh]     Adjusted documentation


Version 0.11.3
--------------

- [Fix]     Try to create logfile directory if it does not exist


Version 0.11.2
--------------

- [Fix]     make install: Add directories if they don't exist


Version 0.11.1
--------------

- [Fix]     ./configure: ignore missing runtime requirements


Version 0.11
------------

- [Fix]     make uninstall: Also remove *.new files
- [Enh]     Prefix path for installation
- [Enh]     ./configure && make && make install routine
- [Enh]     Variable name refactoring
- [Enh]     Added encryption performance documentation
- [Enh]     Added compression performance documentation
- [Enh]     Added xz default preset


Version 0.10
------------

- [Enh]     More documentation about compression
- [Enh]     Added pbzip2 as a much faster pre-configured compression algorithm


Version 0.9
-----------

- [Enh]     Added .editorconfig to the project
- [Fix]     Documentation: dos file types changed to unix
- [Fix]     Install in /usr/local/bin instead of /usr/local/sbin
- [Enh]     Keep original filename after decryption (https://github.com/Paike)
- [Enh]     Make compression algorithm dynamic (thanks to @Paike)


Version 0.8
-----------

- [Enh]     Plugin update
- [Enh]     Documentation
- [Enh]     Makefile adjustments


Version 0.7
-----------

- [Enh]     Better default dump options
- [Enh]     Pass shellcheck


Version 0.6
-----------

- [Enh]     #11 Added choice to use either tmpwatch (redhat/centos/fedora) or tmpreaper (ubuntu/debian)
- [Bug]     #12 Remove files even if EUID doesn’t have write access (have config option for that to enable)


Version 0.5.1
-----------

- [Enh]     Improved Nagios Long output


Version 0.5
-----------

- [Bug]     Do not overwrite configuration files during re-/install
- [Enh]     Tied submodule check_mysqldump-secure to 0.5


Version 0.4
-----------

- [Bug]     Fixed bug when adding up two non integers (time and size)
- [Bug]     Fixed bug when using compression AND encryption together
- [Enh]     Display total Size and total Megabytes at the end
- [Enh]     Adjustable file/folder permission for target dir and db dumps
- [Enh]     List of required databases
- [Enh]     Added evil/bad mysqldump option blacklist


Version 0.3
-----------

- [Enh]     Added Nagios Plugin submodule
- [Enh]     Added Nagios Configuration Options


Version 0.2
-----------

- [Fix]     Added full POSIX compatibility
- [Enh]     Show database size while dumping
- [Enh]     Added installation via composer


Version 0.1
-----------

- [Fix]     Added full POSIX compatibility
- [Enh]     Show database size while dumping

