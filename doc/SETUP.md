[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
Configuration |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---

# mysqldump-secure Configuration

## 1.1 Configure MySQL Credentials
Setup MySQL username, password and host in [/etc/mysqldump-secure.cnf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.cnf) 

```ini
[client]
host = localhost
user = readonlyrootuser
password = "verySecurePasswordWith$%&SpecialChars"
```

Test if the connection settings are working

```shell
$ mysql --defaults-extra-file=/etc/mysqldump-secure.cnf

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 405
Server version: 10.1.9-MariaDB Homebrew

Copyright (c) 2000, 2015, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

If you see the mysql/mariadb prompt then everything went fine and you can continue configuring the program.

## 1.2 Configure MySQLDump Options
Configure the backup behavior in [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf).

### 1.2.1 Encryption
Encryption is done by public/private key via [OpenSSL SMIME](https://www.openssl.org/docs/apps/smime.html) which also supports encrypting large files.

> <sub>The primary advantage of public-key cryptography is increased security and convenience: private keys never need to be transmitted or revealed to anyone. In a secret-key system, by contrast, the secret keys must be transmitted (either manually or through a communication channel) since the same key is used for encryption and decryption. A serious concern is that there may be a chance that an enemy can discover the secret key during transmission.</sub>
> <sub>[[1]](http://www.emc.com/emc-plus/rsa-labs/standards-initiatives/advantages-and-disadvantages.htm)</sub>

See [Encryption guidelines](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) for more info about how to create the keys and manually encrypt/decrypt.

#### 1.2.1.1 Create the keypair
In order to enable encryption you need a public/private keypair. If you don't know how to generate them you can use provided script: [create-keypair.sh](https://github.com/cytopia/mysqldump-secure/blob/master/bin/create-keypair.sh).

Once you have the keys

1. Move the private key away from the server to a very secure location.
2. Copy the public key to `/etc/mysqldump-secure.pub.pem`
3. `chmod 400 /etc/mysqldump-secure.pub.pem`

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
ENCRYPT=1
OPENSSL_PUBKEY_PEM="/etc/mysqldump-secure.pub.pem"
OPENSSL_ALGO_ARG="-aes256"
```


### 1.2.2 Compression
MySQL database dumps can be piped directly to `gzip`, `bzip2`, `lzma` or `lzop` (depending on your choice) before writing them to disk.

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
COMPRESS=1
# Gzip
COMPRESS_BIN="gzip"
COMPRESS_ARG="-9 --stdout"
COMPRESS_EXT="gz"
```
By default, when enabling compression `gzip` is already pre-configured, you can however also change it to one of the above algorithms by uncommenting a different block (and also commenting the gzip block). The other blocks are also pre-configured and look like this:
```shell
# Bzip2
#COMPRESS_BIN="bzip2"
#COMPRESS_ARG="-9 --stdout"
#COMPRESS_EXT="bz2"

# PBzip2
# (multithreaded bzip2 version)
#COMPRESS_BIN="pbzip2"
#COMPRESS_ARG="-9 --stdout"
#COMPRESS_EXT="bz2"

# xz
# (algo: lzma2)
#COMPRESS_BIN="xz"
#COMPRESS_ARG="-9 --stdout"
#COMPRESS_EXT="xz"

# LZMA
# (On modern systems it is usually an alias to 'xz --format=lzma')
#COMPRESS_BIN="lzma"
#COMPRESS_ARG="-9 --stdout"
#COMPRESS_EXT="lzma"

# LZOP
#COMPRESS_BIN="lzop"
#COMPRESS_ARG="-9 --stdout"
#COMPRESS_EXT="lzo"
```

If you use a compression algorithm that differs from the above pre-configured ones, simply add it to the config file and use yours. It would also be nice of you to then drop me a pull request with all other algorithms you add, so we can have it pre-configured in the git repository.

See [doc/Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) for performance and other info.


### 1.2.3 Blacklisting
Mysqldump-secure uses opt-out instead of opt-in and will by default dump every readable database to disk. If you however want to manually ignore certain databases, such as `information_schema` or `performance_schema` you can specify them in a ignore list.

**Opt-out vs Opt-in**
The disadvantage of opt-out is that you might backup a database that is not needed. On the other hand if you use opt-in you could forget a database that was actually needed to be backed up.

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
IGNORE="information_schema performance_schema"
```

### 1.2.4 Whitelisting (Requiring)
If you need to make sure that a specific (or many specific) database(s) must be dumped regardless, add it space-separated to this variable. If the specified databases cannot be dumped (no access rights, missing, whatever reason), the dump script will throw an error which is catchable by cron as well as by the included nagios script.

This option is here to make sure you will be informed, that your desired database was not dumped.
```shell
REQUIRED="mysql databaseX databaseY"
#REQUIRED=""
```

### 1.2.5 Tmpwatch/Tmpreaper integration
If you have [tmpwatch](http://linux.die.net/man/8/tmpwatch) or [tmpreaper](http://manpages.ubuntu.com/manpages/hardy/man8/tmpreaper.8.html) installed you can specify to automatically delete backups older than X hours.

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables:
Enable `1` or disable `1` automatic deletion
```shell
DELETE=1
#DELETE=0
```

Choose the binary to use `tmpwatch` or `tmpreaper`
```shell
DELETE_METHOD="tmpwatch"	# Use this for redhat/centos/fedora
#DELETE_METHOD="tmpreaper"	# Use this for debian/ubuntu
```

If your database backups are stored readonly (e.g. chmod 400), tmpwatch/tmpreaper will fail to delete them. In order to overcome this, the `-f` (`--force`) flag must be parsed along.

> Remove files even if EUID doesn’t have write access (akin to  rm -f). Normally,  files owned by the current EUID, with no write  bit set are not removed.

```shell
DELETE_FORCE=1				# Remove files even if EUID doesn’t have write access
#DELETE_FORCE=0				# Do not delete read-only files
```

Delete files older than X hours

```shell
DELETE=720 # 720 hours
```


### 1.2.6 File logging
Mysqldump-secure includes a mechanism to log every action (debug, info, warn and error) to file. The script also follows the practise of sending proper exit codes (0 for everything went fine and >0 for I had some errors).

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
LOG=1
LOGFILE="/var/log/mysqldump-secure.log"
```

### 1.2.7 Mysqldump options
You can specify custom mysqldump parameters in the configuration file. The default configuration dumps databases including events, triggers and routines. The dump is done via `--single-transaction` to also take transactional tables into account. All those parameters are customizable so alter them as desired.

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
MYSQL_OPTS='--events --triggers --routines --single-transaction --opt'
```
See [mysqldump](https://dev.mysql.com/doc/refman/5.0/en/mysqldump.html) for all possible parameters.

### 1.2.8 Nagios output log
It is possible to fully integrate the backup procedure into a nagios/icinga environment. For that to use you will need to enable Nagios Logging, which will then create a special logfile that is overwritten every time the dump is triggered.
The Nagios Log file can be used by [check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure) to integrate the current state into nagios.

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
NAGIOS_LOG=1
NAGIOS_LOGFILE="/var/log/mysqldump-secure.nagios.log"
```
See [Plugin Readme](https://github.com/cytopia/check_mysqldump-secure) for further instructions and a variety of screenshots.



## 1.3 Setup Cronjob
The script is intended to be run automatically via cron. If you set it up this way, I highly recommend to turn on logging in order to see any warnings or errors that might have occured. Once logging is enabled, the logfile is always protected by file permissions so no other user can see what you are backing up.

*Note for cronjobs*:

Redirect `stdout` to `/dev/null`, otherwise cron will generate an email if a program produces output stdout or stderr.
All errors and warnings will be redirected to `stderr` automatically by the script, when running in cron mode (`--cron`) so you will receive an email only in case something goes wrong.
```script
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed

# Dump MySQL Databases at 03:15 every day
  15 3  *  *  * /bin/sh /usr/local/sbin/mysqldump-secure --cron
```
