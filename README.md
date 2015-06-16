# mysqldump-secure
[![Build Status](https://travis-ci.org/cytopia/mysqldump-secure.svg?branch=master)](https://travis-ci.org/cytopia/mysqldump-secure)

Security-first backup script to dump MySQL databases via cron or command line with additional options for encryption, compression, blacklisting, logging and custom mysqldump parameters.

## Caution
Most mysqldump scripts I have seen out there use something like this:
```shell
mysqldump --user=root --password=foo --host localhost database > database.sql
```
**THIS IS REALLY DANGEROUS**

Even if run inside a script, you can see the mysql password in cleartext in `ps aux`.
You should always define your credentials in a my.cnf file with `chmod 400` or you can loose all your databases to everybody with access to that machine.

**man mysql / man mysqldump**

Specifying a password on the command line should be considered insecure. See [End-User Guidelines for Password Security](https://dev.mysql.com/doc/refman/5.7/en/password-security-user.html). You can use an option file to avoid giving the password on the command line.


## Features

**Encryption**

On-the-fly public/private key encryption of database dumps. The advantage of public/private key encryption is
that even if your server is compromised the database dumps cannot be decrypted as it needs the private key which should be far away in a secure location. Encryption is done via [OpenSSL SMIME](https://www.openssl.org/docs/apps/smime.html)

**Opt-out / blacklisting**

By default all databases are dumped one by one that you do not accidentally forget to add new databases.
If however you want to exclude certain databases such as for example 'information_schema' you can add them to the IGNORE list

**Dump Options**

You can specify custom mysqldump parameters in the configuration file. The default configuration dumps databases including events, triggers and routines. The dump is done via `--single-transaction` to also take transactional tables into account. All those parameters are customizable so alter them as desired.

**Compression**

Databases can be writting to disk via `gzip` compression in order to save storage.

**Logging**

You can turn on logging to file.

**Tmpwatch Integration**

You can enable deletion of backup files older than X hours (requires [tmpwatch](http://linux.die.net/man/8/tmpwatch) to be installed)

**Verbosity**

The verbosity is currently static and is quite talkative. Informing you about missing directories, wrong permissions, dumping time, etc. Just have a look at the code.

**Error Checking**

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



## Quick Start (Automatic)
Install everything including proper access right via make.
```shell
sudo make install
```
Adjust [mysqldump-secure.conf](mysqldump-secure.conf) and [mysqldump-secure.cnf](mysqldump-secure.cnf) and make sure that all required directories exist. If both configuration files are setup correctly, simply execute the script to autogenerate directories, files and permissions.


## Quick Start (Manual)

Copy the config file to /etc and the script itself to any sbin directory.
Make sure that the configuration file can not be read by others as you will need to store the MySQL credentials inside.
```shell
cp mysqldump-secure.conf /etc/mysqldump-secure.conf
chmod 400 /etc/mysqldump-secure.conf

cp mysqldump-secure.cnf /etc/mysqldump-secure.cnf
chmod 400 /etc/mysqldump-secure.cnf

cp mysqldump-secure.sh /usr/local/sbin/mysqldump-secure.sh
chmod +x /usr/local/sbin/mysqldump-secure.sh
```

Make sure to adjust the configuration and create the backup directory and the logfile (optionally).
```
mkdir -p /shared/backup/databases
chmod 700 /shared/backup/databases

touch /var/log/mysqldump-secure.log
chmod 600 /var/log/mysqldump-secure.log
```

Once you have tested the script you can setup the cronjob like so:
```
# Dump MySQL Databases at 03:15 every day
  15 3  *  *  * /bin/sh /usr/local/sbin/mysqldump-secure.sh
```


## Encryption / Decryption
See [examples](examples) for scripts to generate public/private keys, encrypt and decrypt.



## Configuration
See [mysqldump-secure.conf](mysqldump-secure.conf) for all options.



## Contribution
See [contribution guidelines](doc/CONTRIBUTING.md).



## Todo
See [Todo list](doc/TODO.md)



## Licence
See [License](doc/LICENSE)
