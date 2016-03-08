# [![MDS](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/logo.png)](http://mysqldump-secure.org)mysqldump-secure

[General Warning](https://github.com/cytopia/mysqldump-secure#1-general-warning) |
[Features](https://github.com/cytopia/mysqldump-secure#2-features) |
[Installation](https://github.com/cytopia/mysqldump-secure#3-installation) |
[Configuration](https://github.com/cytopia/mysqldump-secure#4-configuration) |
[Usage](https://github.com/cytopia/mysqldump-secure#5-usage) |
[Documentation](https://github.com/cytopia/mysqldump-secure#6-documentation) |
[Contribution](https://github.com/cytopia/mysqldump-secure#7-contribution) |
[License](https://github.com/cytopia/mysqldump-secure#8-license) |
[Version](https://github.com/cytopia/mysqldump-secure#9-version)

[![Build Status](https://travis-ci.org/cytopia/mysqldump-secure.svg?branch=master)](https://travis-ci.org/cytopia/mysqldump-secure)
[![Latest Stable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/stable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Total Downloads](https://poser.pugx.org/cytopia/mysqldump-secure/downloads)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Latest Unstable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/unstable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](http://opensource.org/licenses/MIT)
[![POSIX](https://img.shields.io/badge/posix-100%25-brightgreen.svg)](https://en.wikipedia.org/?title=POSIX)
[![Type](https://img.shields.io/badge/type-%2Fbin%2Fsh-red.svg)](https://en.wikipedia.org/?title=Bourne_shell)

Mysqldump-secure is a POSIX compliant shell backup script for MySQL databases with strong security in mind.
It will backup every available database (which is readable by the specified user) as a separate file with the possibility to opt out via blacklisting. Dumped databases can optionally be piped directly to gzip or openssl in order to compress and/or encrypt the backup. Encryption is done before the file is written to disk to avoid possible race conditions.


Find the project website at [mysqldump-secure.org](http://mysqldump-secure.org)  
Find the whole post at [www.everythingcli.org](http://www.everythingcli.org/index.php/2015/06/13/secure-mysqldump-script-with-encryption-and-compression/)

##### Tested on
[![FreeBSD](https://raw.githubusercontent.com/cytopia/icons/master/64x64/freebsd.png)](https://www.freebsd.org)
[![RedHat](https://raw.githubusercontent.com/cytopia/icons/master/64x64/redhat.png)](https://www.redhat.com)
[![CentOS](https://raw.githubusercontent.com/cytopia/icons/master/64x64/centos.png)](https://www.centos.org)
[![Debian](https://raw.githubusercontent.com/cytopia/icons/master/64x64/debian.png)](https://www.debian.org)
[![ArchLinux](https://raw.githubusercontent.com/cytopia/icons/master/64x64/archlinux.png)](https://www.archlinux.org)
[![Ubuntu](https://raw.githubusercontent.com/cytopia/icons/master/64x64/ubuntu.png)](https://www.ubuntu.com)
[![OSX](https://raw.githubusercontent.com/cytopia/icons/master/64x64/osx.png)](https://www.apple.com/osx)

<sub>(If the script runs on any other system not mentioned here, please drop me a note.)</sub>



## 1. Tested intensively

Every push to `mysqldump-secure` triggers `travis-ci` which will run hundreds of all kinds of tests against the new code and stress the tool in every way. You can find the tests within the `.travis` folder including an automated setup to get a master-slave server with SSL encryption setup.

See [travis-ci.org/cytopia/mysqldump-secure](travis-ci.org/cytopia/mysqldump-secure) for what is going on.


## 2. Features

### Primary Features

* **Encryption** (hybrid encryption: `RSA` and `AES` via `openssl smime`)
* **Compression** (`gzip`, `pigz`, `bzip2`, `pbzip2`, `lzop`, `lzma`, `xz`)
* **Tmpwatch** integration (`tmpwatch` or `tmpreaper`)
* **Transaction-safe** / **Consistent** backups across tables (for DBs with: InnoDB only, mixed and non-InnoDB tables)
* **Conditional mysqldump options** (e.g.: apply `--quick` on DBs > 200MB)
* **Nagios** / **Icinga** integration ([check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure))

### Secondary Features

* Custom mysqldump options
* Master/Slave recognition
* Blacklisting
* Whitelisting
* File logging
* Self validation
* Rock stable (see travis for hundreds of checks)
* 100% POSIX compliant


## 3. Installation

### 3.1 Linux, BSD and OSX

```shell
wget https://github.com/cytopia/mysqldump-secure/archive/0.15.tar.gz -O - | tar -xz
cd mysqldump-secure
./configure
make
sudo make install
```

### 3.2 OSX
```shell
brew tap cytopia/tap
brew install mysqldump-secure
```


For more detailed instructions go to the **[Install guidelines](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md)**


## 4. Configuration

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

## 5. Usage

### 5.1 Usage
```shell
Usage: mysqldump-secure [--cron] [--test] [--conf] [-v[v]] [--help] [--version]
       mysqldump-secure --cron [--conf]
       mysqldump-secure --test [--conf] [-v[v]]
       mysqldump-secure [--conf] [-v[v]]
       mysqldump-secure --help
       mysqldump-secure --version

When invoked without any arguments, it will start dumping databases as
defined in mysqldump-secure.conf.

  --conf          Pass different configuration file than the default one.
                  E.g.: --conf=/etc/mysqldump-secure-alt.conf

  --cron          Use for cron run. It will only output errors and warnings
                  and will silence all debug output.

  --test          Test requirements and exit.

  -v              Show debug (and trace) output.
                  Specify twice (-vv) to also show trace output.
                  Can be combined with --conf  and --test
                  E.g.: -v or -vv

  --help          Show this help screen.

  --version       Show version information.
```

### 5.2 Default

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

### 5.2 Custom config

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


## 6. Documentation

| File | Description |
|------|-------------|
| [mysqldump-secure.org](http://mysqldump-secure.org) | mysqldump-secure homepage |
| [Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) | Different ways to install mysqldump-secure |
| [Requirements](https://github.com/cytopia/mysqldump-secure/blob/master/doc/REQUIREMENTS.md) | What tools are required to run mysqldump-secure |
| [Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) | How to configure mysqldump-secure |
| [Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) | Information and usage about security measurements |
| [Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) | Information and usage about compression |
| [Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) | Information and usage about the used encryption |
| [Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) | Some command line examples such as mass importing databases back into the server |
| [www.everythingcli.org](http://www.everythingcli.org/secure-mysqldump-script-with-encryption-and-compression/) | General thoughts and initial idea for this project. |


## 7. Contribution
Contributors are welcome.

If the script runs on an operating system productively, which is currently not yet included at the top of this document, please let me know, so I can add it for reference.

If you use the script, star it or let me know somehow.

If you like have a look at the [Contributing Guidelines](CONTRIBUTING.md) and see if there is anything you would like to take care of.


## 8. License
[![license](https://poser.pugx.org/cytopia/mysqldump-secure/license)](http://opensource.org/licenses/mit)

## 9. Version
For a complete list of verion see [CHANGELOG](CHANGELOG.md)
