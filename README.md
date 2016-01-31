# mysqldump-secure

[General Warning](https://github.com/cytopia/mysqldump-secure#1-general-warning) |
[Feature Overview](https://github.com/cytopia/mysqldump-secure#2-feature-overview) |
[Installation](https://github.com/cytopia/mysqldump-secure#3-installation) |
[Configuration](https://github.com/cytopia/mysqldump-secure#4-configuration) |
[Documentation](https://github.com/cytopia/mysqldump-secure#5-documentation) |
[Contribution](https://github.com/cytopia/mysqldump-secure#6-contribution) |
[License](https://github.com/cytopia/mysqldump-secure#7-license) |
[Version](https://github.com/cytopia/mysqldump-secure#8-version)

[![Build Status](https://travis-ci.org/cytopia/mysqldump-secure.svg?branch=master)](https://travis-ci.org/cytopia/mysqldump-secure)
[![Latest Stable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/stable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Total Downloads](https://poser.pugx.org/cytopia/mysqldump-secure/downloads)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Latest Unstable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/unstable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](http://opensource.org/licenses/MIT)
[![POSIX](https://img.shields.io/badge/posix-100%25-brightgreen.svg)](https://en.wikipedia.org/?title=POSIX)
[![Type](https://img.shields.io/badge/type-%2Fbin%2Fsh-red.svg)](https://en.wikipedia.org/?title=Bourne_shell)

Mysqldump-secure is a POSIX compliant shell backup script for MySQL databases with strong security in mind.
It will backup every available database (which is readable by the specified user) as a separate file with the possibility to opt out via blacklisting. Dumped databases can optionally be piped directly to gzip or openssl in order to compress and/or encrypt the backup. Encryption is done before the file is written to disk to avoid possible race conditions.

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

##### Requirements
| Program  | Required | Description |
| ------------- | ------------- | -------- |
| bourne shell (sh)  | yes  | The whole script is written in pure bourne shell (sh) and is 100% Posix compliant |
| [mysql](https://dev.mysql.com/downloads/mysql/)  | yes  | The mysql binary is used to find all available databases and their corresponding size |
| [mysqldump](https://dev.mysql.com/downloads/mysql/)  | yes  | This is used for the actual dump procedure |
| [openssl](https://www.openssl.org)  | optional  | Optionally used for private/public key encrypting the database dump |
| [gzip](http://www.gzip.org)  | optional  | Optionally used for compressing the database dump |
| [bzip2](http://www.bzip.org/)  | optional  | Optionally used for compressing the database dump |
| [pbzip2](http://compression.ca/pbzip2/)  | optional  | Optionally used for compressing the database dump (multithreaded) |
| [xz](http://www.bzip.org/)  | optional  | Optionally used for compressing the database dump |
| [lzma](http://tukaani.org/lzma/)  | optional  | Optionally used for compressing the database dump |
| [lzop](http://www.lzop.org/)  | optional  | Optionally used for compressing the database dump |
| [tmpwatch](https://fedorahosted.org/tmpwatch/)  | optional  | Optionally used to delete old database dumps |
| [tmpreaper](https://packages.debian.org/sid/tmpreaper)  | optional  | Optionally used to delete old database dumps |
| [check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure)  | optional  | Optionally used to monitor the dump via nagios (already bundled as a submodule inside this repository) |


## 1. General Warning
Most mysqldump scripts I have seen out there do something like this:
```shell
mysqldump --user=root --password=foo --host=localhost database > database.sql
```
**THIS IS REALLY DANGEROUS**

Even if run inside a script, you can see the mysql password in cleartext in `ps aux`.
You should always define your credentials in a my.cnf file with `chmod 400` or you can loose all your databases to everybody with access to that machine.

> <sub>[MySQL End-User Guidelines for Password Security](https://dev.mysql.com/doc/refman/5.7/en/password-security-user.html)</sub>

> <sub>Specifying a password on the command line should be considered insecure. You can use an option file to avoid giving the password on the command line.</sub>



## 2. Feature Overview
* Compression (`gzip`, `bzip2`, `pbzip2`, `lzop`, `lzma`, `xz`)
* Encryption (`openssl` private/public key)
* Blacklisting
* Whitelisting
* Tmpwatch integration (`tmpwatch` or `tmpreaper`)
* File logging
* Custom mysqldump options
* Security validation
* Nagios/Icinga integration ([check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure))
* 100% POSIX compliant



## 3. Installation

### 3.1 Linux/BSD

```shell
git clone --recursive https://github.com/cytopia/mysqldump-secure.git
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

For more detailed instructions go to the [Install guidelines](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md)


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


## 5. Documentation

| File | Description |
|------|-------------|
| [Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) | Different ways to install mysqldump-secure |
| [Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) | How to configure mysqldump-secure |
| [Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) | Information and usage about compression |
| [Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) | Information and usage about the used encryption |
| [Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) | Some command line examples such as mass importing databases back into the server |
| [www.everythingcli.org](http://www.everythingcli.org/secure-mysqldump-script-with-encryption-and-compression/) | General thoughts and initial idea for this project. |


## 6. Contribution
Contributors are welcome.

If the script runs on an operating system productively, which is currently not yet included at the top of this document, please let me know, so I can add it for reference.

If you use the script, star it or let me know somehow.

If you like have a look at the [Contributing Guidelines](CONTRIBUTING.md) and see if there is anything you would like to take care of.


## 7. License
[![license](https://poser.pugx.org/cytopia/mysqldump-secure/license)](http://opensource.org/licenses/mit)

## 8. Version
For a complete list of verion see [CHANGELOG](CHANGELOG.md)


## 9. Awesome

Added by the following [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome) lists:

* [awesome-mysql](https://shlomi-noach.github.io/awesome-mysql/) ([github](https://github.com/shlomi-noach/awesome-mysql))

