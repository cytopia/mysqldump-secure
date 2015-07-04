# mysqldump-secure

[General Warning](https://github.com/cytopia/mysqldump-secure#1-general-warning) |
[Feature Overview](https://github.com/cytopia/mysqldump-secure#2-feature-overview) |
[Installation](https://github.com/cytopia/mysqldump-secure#3-installation) |
[Configuration](https://github.com/cytopia/mysqldump-secure#4-configuration) |
[Contribution](https://github.com/cytopia/mysqldump-secure#5-contribution) |
[Todo](https://github.com/cytopia/mysqldump-secure#6-todo) |
[License](https://github.com/cytopia/mysqldump-secure#7-license)

[![Build Status](https://travis-ci.org/cytopia/mysqldump-secure.svg?branch=master)](https://travis-ci.org/cytopia/mysqldump-secure)
[![Latest Stable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/stable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Total Downloads](https://poser.pugx.org/cytopia/mysqldump-secure/downloads)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Latest Unstable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/unstable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](doc/LICENSE)
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
| [tmpwatch](https://fedorahosted.org/tmpwatch/)  | optional  | Optionally used to delete old database dumps |
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
* Encryption
* Compression
* Blacklisting
* Tmpwatch integration
* File logging
* Custom mysqldump options
* Security validation
* Nagios integration
* 100% POSIX compliant



## 3. Installation

### 3.1 Download

Download via git or composer
```shell
# Make sure to clone recursively to also get the submodules
git clone --recursive https://github.com/cytopia/mysqldump-secure.git
```

```shell
composer create-project cytopia/mysqldump-secure
```

### 3.2 Automated installation
Automated installation and setting of access rights via `unix Makefile`.
```shell
sudo make install
```

### 3.3 Manual installation
If you do not trust the `Makefile` you can also manually copy the files and adjust the file permissions by hand.
```shell
# Copy the script
cp mysqldump-secure /usr/local/sbin/mysqldump-secure
chmod +x /usr/local/sbin/mysqldump-secure

# Copy the config files
cp mysqldump-secure.conf /etc/mysqldump-secure.conf
chmod 400 /etc/mysqldump-secure.conf

cp mysqldump-secure.cnf /etc/mysqldump-secure.cnf
chmod 400 /etc/mysqldump-secure.cnf

# Create the backup dir
mkdir -p /shared/backup/databases
chmod 700 /shared/backup/databases

# Create the logfile (optionally)
touch /var/log/mysqldump-secure.log
chmod 600 /var/log/mysqldump-secure.log
```



## 4. Configuration

There are two separate configuration files:
* [/etc/mysqldump-secure.cnf](mysqldump-secure.cnf)
* [/etc/mysqldump-secure.conf](mysqldump-secure.conf)

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



### 4.1 Configure MySQL Credentials
Setup MySQL username, password and host in [/etc/mysqldump-secure.cnf](mysqldump-secure.cnf) and simply test if the connection works via `mysql`.

If you see the mysql prompt then everything went fine and you can continue configuring the program.

### 4.2 Configure MySQLDump Options
Configure the backup behavior in [/etc/mysqldump-secure.conf](mysqldump-secure.conf).

#### 4.2.1 Encryption
Encryption is done by public/private key via [OpenSSL SMIME](https://www.openssl.org/docs/apps/smime.html) which also supports encrypting large files.

> <sub>The primary advantage of public-key cryptography is increased security and convenience: private keys never need to be transmitted or revealed to anyone. In a secret-key system, by contrast, the secret keys must be transmitted (either manually or through a communication channel) since the same key is used for encryption and decryption. A serious concern is that there may be a chance that an enemy can discover the secret key during transmission.</sub>
> <sub>[[1]](http://www.emc.com/emc-plus/rsa-labs/standards-initiatives/advantages-and-disadvantages.htm)</sub>

See [examples](examples) for scripts to generate public/private keys, encrypt and decrypt.

##### 4.2.1.1 Create the keypair
In order to enable encryption you need a public/private keypair. If you don't know how to generate them you can use provided script: [create-keypair.sh](examples/create-keypair.sh).

Once you have the keys

1. Move the private key away from the server to a very secure location.
2. Copy the public key to `/etc/mysqldump-secure.pub.pem`
3. `chmod 400 /etc/mysqldump-secure.pub.pem`

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
ENCRYPT=1
OPENSSL_PUBKEY_PEM="/etc/mysqldump-secure.pub.pem"
OPENSSL_ALGO_ARG="-aes256"
```


#### 4.2.2 Compression
MySQL dumps can be piped directly to `gzip` before writing to disk.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
COMPRESS=1
```

#### 4.2.3 Blacklisting
Mysqldump-secure uses opt-out instead of opt-in and will by default dump every readable database to disk. If you however want to manually ignore certain databases, such as `information_schema` or `performance_schema` you can specify them in a ignore list.

**Opt-out vs Opt-in**
The disadvantage of opt-out is that you might backup a database that is not needed. On the other hand if you use opt-in you could forget a database that was actually needed to be backed up.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
IGNORE="information_schema performance_schema"
```

#### 4.2.4 Tmpwatch integration
If you have [tmpwatch](http://linux.die.net/man/8/tmpwatch) installed you can specify to automatically delete backups older than X hours.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
DELETE=720 # 720 hours
```


#### 4.2.5 File logging
Mysqldump-secure includes a mechanism to log every action (debug, info, warn and error) to file. The script also follows the practise of sending proper exit codes (0 for everything went fine and >0 for I had some errors).

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
LOG=1
LOGFILE="/var/log/mysqldump-secure.log"
```

#### 4.2.6 Mysqldump options
You can specify custom mysqldump parameters in the configuration file. The default configuration dumps databases including events, triggers and routines. The dump is done via `--single-transaction` to also take transactional tables into account. All those parameters are customizable so alter them as desired.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
MYSQL_OPTS='--events --triggers --routines --single-transaction --opt'
```
See [mysqldump](https://dev.mysql.com/doc/refman/5.0/en/mysqldump.html) for all possible parameters.

#### 4.2.7 Nagios output log
It is possible to fully integrate the backup procedure into a nagios/icinga environment. For that to use you will need to enable Nagios Logging, which will then create a special logfile that is overwritten every time the dump is triggered.
The Nagios Log file can be used by [check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure) to integrate the current state into nagios.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
NAGIOS_LOG=1
NAGIOS_LOGFILE="/var/log/mysqldump-secure.nagios.log"
```
See [Plugin Readme](https://github.com/cytopia/check_mysqldump-secure) for further instructions and a variety of screenshots.



### 4.3 Setup Cronjob 
The script is intended to be run automatically via cron. If you set it up this way, I highly recommend to turn on logging in order to see any warnings or errors that might have occured. Once logging is enabled, the logfile is always protected by file permissions so no other user can see what you are backing up.
```script
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed

# Dump MySQL Databases at 03:15 every day
  15 3  *  *  * /bin/sh /usr/local/sbin/mysqldump-secure.sh
```


## 5. Contribution
Contributors are welcome. See [contribution guidelines](doc/CONTRIBUTING.md).

If the script runs on an operating system productively, which is currently not yet included at the top of this document, please let me know, so I can add it for reference.

If you use the script, star it or let me know somehow.


## 6. Todo
See [Todo list](doc/TODO.md)



## 7. License
[![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](doc/LICENSE)
