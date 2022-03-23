# [![MySQLDumpSecure](https://raw.githubusercontent.com/cytopia/icons/master/64x64/mds.png)](http://mysqldump-secure.org) mysqldump-secure

----
**ATTENTION**

Please upgrade to the latest version in order to be notified about the [OpenSSL SMIME Bug](https://github.com/cytopia/mysqldump-secure/issues/21) in case you are affected.


----
**GIT NOTE:**

WHEN CLONING VIA GIT, MAKE SURE TO ALWAYS CHECK OUT THE LATEST TAG.
THE `MASTER` BRANCH IS ALWAYS UNDER DEVELOPMENT AND THEREFORE UNSTABLE.

----

[Features](https://github.com/cytopia/mysqldump-secure#1-features) |
[Installation](https://github.com/cytopia/mysqldump-secure#2-installation) |
[Configuration](https://github.com/cytopia/mysqldump-secure#3-configuration) |
[Usage](https://github.com/cytopia/mysqldump-secure#4-usage) |
[Documentation](https://github.com/cytopia/mysqldump-secure#5-documentation) |
[Contribution](https://github.com/cytopia/mysqldump-secure#6-contribution) |
[License](https://github.com/cytopia/mysqldump-secure#7-license) |
[Version](https://github.com/cytopia/mysqldump-secure#8-version)

[![Build Status](https://travis-ci.org/cytopia/mysqldump-secure.svg?branch=master)](https://travis-ci.org/cytopia/mysqldump-secure)
[![Latest Stable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/stable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Total Downloads](https://poser.pugx.org/cytopia/mysqldump-secure/downloads)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Latest Unstable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/unstable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](http://opensource.org/licenses/MIT)
[![POSIX](https://img.shields.io/badge/posix-100%25-brightgreen.svg)](https://en.wikipedia.org/?title=POSIX)
[![Type](https://img.shields.io/badge/type-%2Fbin%2Fsh-red.svg)](https://en.wikipedia.org/?title=Bourne_shell)

**[Mysqldump-secure](http://mysqldump-secure.org)** is a POSIX compliant wrapper script for `mysqldump` with many features and very strong security in mind.
It will backup every available database (which is readable by the specified user) as a separate file with the possibility to opt out via blacklisting. Dumped databases can optionally be piped directly to gzip or openssl in order to compress and/or encrypt the backup. Encryption is done before the file is written to disk to avoid possible race conditions (See documentation for more info about security measurements).


Find the project website at [https://mysqldump-secure.org](https://mysqldump-secure.org)
Find the whole post at [https://www.everythingcli.org](https://www.everythingcli.org/index.php/2015/06/13/secure-mysqldump-script-with-encryption-and-compression/)

##### Runs on
[![FreeBSD](https://raw.githubusercontent.com/cytopia/icons/master/64x64/freebsd.png)](https://www.freebsd.org)
[![RedHat](https://raw.githubusercontent.com/cytopia/icons/master/64x64/redhat.png)](https://www.redhat.com)
[![CentOS](https://raw.githubusercontent.com/cytopia/icons/master/64x64/centos.png)](https://www.centos.org)
[![Debian](https://raw.githubusercontent.com/cytopia/icons/master/64x64/debian.png)](https://www.debian.org)
[![ArchLinux](https://raw.githubusercontent.com/cytopia/icons/master/64x64/archlinux.png)](https://www.archlinux.org)
[![Ubuntu](https://raw.githubusercontent.com/cytopia/icons/master/64x64/ubuntu.png)](https://www.ubuntu.com)
[![OSX](https://raw.githubusercontent.com/cytopia/icons/master/64x64/osx.png)](https://www.apple.com/osx)

<sub>(If the script runs on any other system not mentioned here, please drop me a note.)</sub>

##### Rock-stable and well tested

Every push to `mysqldump-secure` triggers `travis-ci` which will run hundreds of all kinds of tests against the new code and stress the tool in every possible way with every possible config.

You can find the tests within the [test](test) folder including an automated setup to get a master-slave server with SSL encryption setup. Thoses tests can also be run locally.

See [https://travis-ci.org/cytopia/mysqldump-secure](https://travis-ci.org/cytopia/mysqldump-secure) for checks in action and [test](test) for a description about the tests.


## 1. Features

### Primary Features

* **Encryption** (hybrid encryption: `RSA` and `AES` via `openssl smime` - no password needed)
* **Compression** (`gzip`, `pigz`, `bzip2`, `pbzip2`, `lzop`, `lzma`, `xz`)
* **Tmpwatch** integration (`tmpwatch` or `tmpreaper`)
* **Transaction-safe** / **Consistent** backups across tables (for DBs with: `InnoDB only`-, `mixed`- and `non-InnoDB`- tables)
* **Conditional mysqldump options** (e.g.: apply `--quick` only on DBs > 200MB)
* **Security** (various built-in checks and precautions)
* **SSL Remote Backups**
* **Nagios** / **Icinga** monitoring integration (via [check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure))

### Secondary Features

* Custom mysqldump options
* Master/Slave recognition
* Blacklisting
* Whitelisting
* File logging
* Self validation
* Rock stable (see travis for hundreds of checks)
* 100% POSIX compliant

## 2. Installation

### 2.1 Linux, BSD and OSX

```shell
wget https://github.com/cytopia/mysqldump-secure/archive/0.16.5.tar.gz -O - | tar -xz
cd mysqldump-secure
./configure
make
sudo make install
```

### 2.2 OSX
```shell
brew tap cytopia/tap
brew install mysqldump-secure
```


For more detailed instructions go to the **[Install guidelines](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md)**


## 3. Configuration

There are two separate configuration files:

* [/etc/mysqldump-secure.cnf](etc/mysqldump-secure.cnf)
* [/etc/mysqldump-secure.conf](etc/mysqldump-secure.conf)

The first one is to setup the MySQL credentials and the second one configures the behavior of how to backup the databases.

You do not need to worry about file permissions or directories. The script will auto-check the following options and adjust them as required:

* Logfile exists
* Logfile is writeable
* Auto creation of logfile
* Logging turned off automatically
* Destination dir exists
* Destination dir is writeable
* Auto creation of destination dir
* Required system binaries exist
* MySQL credentials are valid


For more detailed instructions go to the [Setup guidelines](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md)

## 4. Usage

### 4.1 Usage
```shell
Usage: mysqldump-secure [--conf] [--cron] [--test] [-v[v]]
       mysqldump-secure --help
       mysqldump-secure --version

When invoked without any arguments, it will start dumping databases as
defined in mysqldump-secure.conf.

  --conf          Pass a different configuration file than the default one.
                  E.g.: --conf=/etc/mysqldump-secure-alt.conf

  --cron          Use for cron run. It will only output errors and warnings
                  and will silence all info, debug and trace output.

  --test          Test requirements and exit.
                  Combine with -v or -vv for more verbose output.

  -v              Show debug output.
                  Specify twice (-vv) to also show trace output.
                  Can be combined with --conf  and --test

  -vv             Show debug and trace output.
                  Can be combined with --conf  and --test

  --help          Show this help screen.

  --version       Show version information.


Exit codes

  0               All fine, no fatals, no errors and no warnings occured.
  1               Warnings occured, but all dumps were successfull.
  2               Errors occured, but all dumps were successfull.
  3               Failed. Mysqldump encountered errors.
  4               Abort. The program aborted, due to missing requirements,
                  wrong arguments or a misconfiguration.

Further reading

See 'man mysqldump-secure' for more help.
Visist http://mysqldump-secure.org and browse documentation.
```

### 4.2 Default

Test if everything is configured correctly:
```shell
mysqldump-secure --test -vv
```

Manual run from commmand line:
```shell
mysqldump-secure -v
```

Run from within cron
```shell
mysqldump-secure --cron
```

### 4.3 Custom config

It is possible to have multiple instances of `mysqldump-secure` on your machine via different config files. Imagine the case you want to have some sensitive dumps encrypted and others should be dumped in plain. You can achieve this by using two configuration files and the `IGNORE` blocks of each respective config to exclude the other ones.


Test if everything is configured correctly in the specified config:
```shell
mysqldump-secure --test --config=/etc/mysqldump-secure.encrypted.conf
```

Manual run from commmand line:
```shell
mysqldump-secure --config=/etc/mysqldump-secure.encrypted.conf
```

Run from within cron
```shell
mysqldump-secure --cron --config=/etc/mysqldump-secure.encrypted.conf
```

### 4.4 Test run
```shell
$ mysqldump-secure --test -v
[INFO]  (OPT): Logging enabled
[DEBUG] (OPT): Log level: 3
[DEBUG] (OPT): Logfile: /var/log/mysqldump-secure.log
[DEBUG] (CFG): Destination dir: /var/mysqldump-secure
[DEBUG] (CFG): Using file Prefix: 2016-03-09_10-07__
[INFO]  (OPT): MySQL SSL connection enabled
[DEBUG] (OPT): MySQL SSL arguments: --ssl-ca=/etc/mysql.ca.pem.
[INFO]  (OPT): Compression enabled
[DEBUG] (OPT): Compression arguments: gzip -9 --stdout
[INFO]  (OPT): Encryption enabled
[DEBUG] (OPT): Encryption algorithm: -aes256
[INFO]  (OPT): Deletion enabled
[DEBUG] (OPT): Deleting files older than 2 days. Using: tmpwatch
[INFO]  (OPT): Nagios log enabled
[DEBUG] (OPT): Nagios logfile: /var/log/mysqldump-secure.nagios.log
[DEBUG] (SRV): MySQL server connection: 127.0.0.1 via TCP/IP
[DEBUG] (SRV): MySQL server connection: Using SSL (Cipher in use is DHE-RSA-AES256-GCM-SHA384)
[DEBUG] (SRV): MySQL server version:    MariaDB 10.1.11-MariaDB-log Homebrew
[DEBUG] (SRV): MySQL server hostname:   notebook.home.lan:3306
[DEBUG] (SRV): MySQL server rep type:   master
```

### 4.5 Example run
```shell
$ mysqldump-secure -v
[INFO]  (OPT): Logging enabled
[DEBUG] (OPT): Log level: 3
[DEBUG] (OPT): Logfile: /var/log/mysqldump-secure.log
[DEBUG] (CFG): Destination dir: /var/mysqldump-secure
[DEBUG] (CFG): Using file Prefix: 2016-03-09_10-13__
[INFO]  (OPT): MySQL SSL connection enabled
[DEBUG] (OPT): MySQL SSL arguments: --ssl-ca=/etc/mysql.ca.pem.
[INFO]  (OPT): Compression enabled
[DEBUG] (OPT): Compression arguments: gzip -9 --stdout
[INFO]  (OPT): Encryption enabled
[DEBUG] (OPT): Encryption algorithm: -aes256
[INFO]  (OPT): Deletion enabled
[DEBUG] (OPT): Deleting files older than 2 days. Using: tmpwatch
[INFO]  (OPT): Nagios log enabled
[DEBUG] (OPT): Nagios logfile: /var/log/mysqldump-secure.nagios.log
[DEBUG] (SRV): MySQL server connection: 127.0.0.1 via TCP/IP
[DEBUG] (SRV): MySQL server connection: Using SSL (Cipher in use is DHE-RSA-AES256-GCM-SHA384)
[DEBUG] (SRV): MySQL server version:    MariaDB 10.1.11-MariaDB-log Homebrew
[DEBUG] (SRV): MySQL server hostname:   notebook.home.lan:3306
[DEBUG] (SRV): MySQL server rep type:   master
[DEBUG] (SQL): Retrieving list of databases... 9
[INFO]  (SQL): 1/9 Dumping:  db_InnoDB_and_MyISAM (19.90 MB) (compressed) (encrypted) (--lock-tables) (--skip-quick) 0 sec
[INFO]  (SQL): 2/9 Dumping:  db_InnoDB_only (10.52 MB) (compressed) (encrypted) (--single-transaction) (--skip-quick) 1 sec
[INFO]  (SQL): 3/9 Dumping:  db_MyISAM_only (9.38 MB) (compressed) (encrypted) (--lock-tables) (--skip-quick) 0 sec
[INFO]  (SQL): 4/9 Skipping: information_schema (ignored)
[INFO]  (SQL): 5/9 Skipping: my_empty_db1 (DB is empty)
[INFO]  (SQL): 6/9 Skipping: my_empty_db2 (DB is empty)
[INFO]  (SQL): 7/9 Dumping:  mysql (0.62 MB) (compressed) (encrypted) (--lock-tables) (--skip-quick) 0 sec
[INFO]  (SQL): 8/9 Skipping: performance_schema (ignored)
[INFO]  (SQL): 9/9 Skipping: test (DB is empty)
[DEBUG] (RUN): Dumping finished (OK: 4 dbs, IGN: 5 dbs, ERR: 0, TOTAL: 9)
[DEBUG] (RUN): Took 2 seconds
[DEBUG] (RUN): Total size dumped: 40.42 MB
[INFO]  (RUN): Deleting files older than 2 days ... 4
[INFO]  removing file /var/mysqldump-secure/2016-03-07_01-52__db_InnoDB_and_MyISAM.sql.gz.enc
[INFO]  removing file /var/mysqldump-secure/2016-03-07_01-52__db_InnoDB_only.sql.gz.enc
[INFO]  removing file /var/mysqldump-secure/2016-03-07_01-52__db_MyISAM_only.sql.gz.enc
[INFO]  removing file /var/mysqldump-secure/2016-03-07_01-52__mysql.sql.gz.enc
[DEBUG] (RUN): Writing nagios logfile
[OK]    Finished successfully
```


## 5. Documentation

| File | Description |
|------|-------------|
| [https://mysqldump-secure.org](https://mysqldump-secure.org) | Project homepage |
| [https://www.everythingcli.org](https://www.everythingcli.org/secure-mysqldump-script-with-encryption-and-compression/) | Blog post: General thoughts and initial idea for this project. |
| [Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) | Different ways to install mysqldump-secure |
| [Requirements](https://github.com/cytopia/mysqldump-secure/blob/master/doc/REQUIREMENTS.md) | What tools are required to run mysqldump-secure |
| [Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) | How to configure mysqldump-secure |
| [Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) | Information and usage about security measurements |
| [Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) | Information and usage about compression |
| [Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) | Information and usage about the used encryption |
| [Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) | Some command line examples such as mass importing databases back into the server |


## 6. Contribution
Contributors are welcome.

If the script runs on an operating system productively, which is currently not yet included at the top of this document, please let me know, so I can add it for reference.

If you use the script, star it or let me know somehow.

If you like have a look at the [Contributing Guidelines](CONTRIBUTING.md) and see if there is anything you would like to take care of.


## 7. License
[![license](https://poser.pugx.org/cytopia/mysqldump-secure/license)](http://opensource.org/licenses/mit)

## 8. Version
For a complete list of verion see [CHANGELOG](CHANGELOG.md)
