# mysqldump-secure

[General Warning](https://github.com/cytopia/mysqldump-secure#general-warning) |
[Feature Overview](https://github.com/cytopia/mysqldump-secure#feature-overview) |
[Installation](https://github.com/cytopia/mysqldump-secure#installation) |
[Configuration](https://github.com/cytopia/mysqldump-secure#configuration) |
[Contribution](https://github.com/cytopia/mysqldump-secure#contribution) |
[Todo](https://github.com/cytopia/mysqldump-secure#todo) |
[License](https://github.com/cytopia/mysqldump-secure#license)

[![Build Status](https://travis-ci.org/cytopia/mysqldump-secure.svg?branch=master)](https://travis-ci.org/cytopia/mysqldump-secure)
[![Latest Stable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/stable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Total Downloads](https://poser.pugx.org/cytopia/mysqldump-secure/downloads)](https://packagist.org/packages/cytopia/mysqldump-secure) [![Latest Unstable Version](https://poser.pugx.org/cytopia/mysqldump-secure/v/unstable)](https://packagist.org/packages/cytopia/mysqldump-secure) [![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](doc/LICENSE)
[![POSIX](https://img.shields.io/badge/posix_compliant-100%25-brightgreen.svg)](https://en.wikipedia.org/?title=POSIX)

Mysqldump-secure is a POSIX compliant shell backup script for MySQL databases with strong security in mind.
It will backup every available database (which is readable by the specified user) as a separate file with the possibility to opt out via blacklisting. Dumped databases can optionally be piped directly to gzip or openssl in order to compress and/or encrypt the backup. Encryption is done before the file is written to disk to avoid possible race conditions.

Find the whole post at [www.everythingcli.org](http://www.everythingcli.org/index.php/2015/06/13/secure-mysqldump-script-with-encryption-and-compression/)

##### Tested on
[![FreeBSD](https://raw.githubusercontent.com/cytopia/icons/master/64x64/freebsd.png)](https://www.freebsd.org)
[![RedHat](https://raw.githubusercontent.com/cytopia/icons/master/64x64/redhat.png)](https://www.redhat.com)
[![CentOS](https://raw.githubusercontent.com/cytopia/icons/master/64x64/centos.png)](https://www.centos.org/)
[![Debian](https://raw.githubusercontent.com/cytopia/icons/master/64x64/debian.png)](https://www.debian.org/)


## General Warning
Most mysqldump scripts I have seen out there do something like this:
```shell
mysqldump --user=root --password=foo --host localhost database > database.sql
```
**THIS IS REALLY DANGEROUS**

Even if run inside a script, you can see the mysql password in cleartext in `ps aux`.
You should always define your credentials in a my.cnf file with `chmod 400` or you can loose all your databases to everybody with access to that machine.

> [MySQL End-User Guidelines for Password Security](https://dev.mysql.com/doc/refman/5.7/en/password-security-user.html)

> Specifying a password on the command line should be considered insecure. You can use an option file to avoid giving the password on the command line.



## Feature Overview

* Encryption
* Compression
* Blacklisting
* Tmpwatch integration
* File logging
* Error checking / security validation
* Custom mysqldump options


## Installation

### Automated installation
Automated installation and setting of access rights via `unix Makefile`.
```shell
sudo make install
```
Adjust the configuration and you are good to go.
```shell
vim /etc/mysqldump-secure.conf
vim /etc/mysqldump-secure.cnf
```


### Manual installation
If you do not trust the `Makefile` you can also manually copy the files and adjust file permissions by hand.
```shell
# Copy the script
cp mysqldump-secure.sh /usr/local/sbin/mysqldump-secure.sh
chmod +x /usr/local/sbin/mysqldump-secure.sh

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
Adjust the configuration and you are good to go.
```shell
vim /etc/mysqldump-secure.conf
vim /etc/mysqldump-secure.cnf
```

### Cronjob
Once you have tested the script you can setup the cronjob:
```
# Dump MySQL Databases at 03:15 every day
  15 3  *  *  * /bin/sh /usr/local/sbin/mysqldump-secure.sh
```


## Configuration
Before you start make sure to have the credentials setup correctly.

1. Copy [mysqldump-secure.cnf](mysqldump-secure.cnf) to `/etc/mysqldump-secure.cnf`
2. Adjust credentials: `vi /etc/mysqldump-secure.cnf`
3. Set permissions: `chmod 400 /etc/mysqldump-secure.cnf`
4. Test connection: `mysql`

If you see the mysql prompt then everything went fine and you can continue configuring the program.


### Encryption
Encryption is done by public/private key via [OpenSSL SMIME](https://www.openssl.org/docs/apps/smime.html) which also supports encrypting large files.

> The primary advantage of public-key cryptography is increased security and convenience: private keys never need to be transmitted or revealed to anyone. In a secret-key system, by contrast, the secret keys must be transmitted (either manually or through a communication channel) since the same key is used for encryption and decryption. A serious concern is that there may be a chance that an enemy can discover the secret key during transmission.
> [[1]](http://www.emc.com/emc-plus/rsa-labs/standards-initiatives/advantages-and-disadvantages.htm)

See [examples](examples) for scripts to generate public/private keys, encrypt and decrypt.

#### Create the keypair
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


### Compression
MySQL dumps can be piped directly to `gzip` before writing to disk.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
COMPRESS=1
```

### Blacklisting
Mysqldump-secure uses opt-out instead of opt-in and will by default dump every readable database to disk. If you however want to manually ignore certain databases, such as `information_schema` or `performance_schema` you can specify them in a ignore list.

**Opt-out vs Opt-in**
The disadvantage of opt-out is that you might backup a database that is not needed. On the other hand if you use opt-in you could forget a database that was actually needed to be backed up.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
IGNORE="information_schema performance_schema"
```

### Tmpwatch integration
If you have [tmpwatch](http://linux.die.net/man/8/tmpwatch) installed you can specify to automatically delete backups older than X hours.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
DELETE=720 # 720 hours
```


### File logging
Mysqldump-secure includes a mechanism to log every action (debug, info, warn and error) to file. The script also follows the practise of sending proper exit codes (0 for everything went fine and >0 for I had some errors).

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
LOG=1
LOGFILE="/var/log/mysqldump-secure.log"
```


### Error checking / security validation
The script performs heavy error checking and is able to fall back to default options. Checking includes:
* Logfile exists
* Logfile is writeable
* Auto creation of logfile
* Logging turned off automatically
* Destination dir exists
* Destination dir is writeable
* Auto creation of destination dir
* Required system binaries exist
* MySQL credentials are valid

### Custom mysqldump options
You can specify custom mysqldump parameters in the configuration file. The default configuration dumps databases including events, triggers and routines. The dump is done via `--single-transaction` to also take transactional tables into account. All those parameters are customizable so alter them as desired.

Open [/etc/mysqldump-secure.conf](mysqldump-secure.conf) and set the following variables
```shell
MYSQL_OPTS='--events --triggers --routines --single-transaction --opt'
```
See [mysqldump](https://dev.mysql.com/doc/refman/5.0/en/mysqldump.html) for all possible parameters.


## Contribution
Contributors are welcome. See [contribution guidelines](doc/CONTRIBUTING.md).


## Todo
See [Todo list](doc/TODO.md)



## License
[![License](https://poser.pugx.org/cytopia/mysqldump-secure/license)](doc/LICENSE)
