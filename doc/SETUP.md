[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Requirements](https://github.com/cytopia/mysqldump-secure/blob/master/doc/REQUIREMENTS.md) |
Configuration |
[Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
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
$ mysqldump-secure --test -v

[INFO]  (OPT): Logging enabled
[DEBUG] (OPT): Log level: 1
[DEBUG] (OPT): Logfile: /var/log/mysqldump-secure.log
[DEBUG] (CFG): Destination dir: /var/mysqldump-secure
[DEBUG] (CFG): Using file Prefix: 2016-03-08_15-09__
[INFO]  (OPT): MySQL SSL connection enabled
[DEBUG] (OPT): MySQL SSL arguments: --ssl-ca=/usr/local/etc/certs/mysql.ca.pem.
[INFO]  (OPT): Compression enabled
[DEBUG] (OPT): Compression arguments: gzip -9 --stdout
[INFO]  (OPT): Encryption disabled
[INFO]  (OPT): Deletion enabled
[DEBUG] (OPT): Deleting files older than 30 days. Using: tmpwatch
[INFO]  (OPT): Nagios log enabled
[DEBUG] (OPT): Nagios logfile: /var/log/mysqldump-secure.nagios.log
[DEBUG] (SRV): MySQL server connection: Localhost via UNIX socket
[DEBUG] (SRV): MySQL server connection: Using SSL (Cipher in use is DHE-RSA-AES256-GCM-SHA384)
[DEBUG] (SRV): MySQL server version:    MariaDB 10.1.11-MariaDB-log Homebrew
[DEBUG] (SRV): MySQL server hostname:   mycoolhost:3306
[DEBUG] (SRV): MySQL server rep type:   master
```

If you see the mysql section and the script does no abort everything went fine and you can continue configuring the program.

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

You can also use the wildcard character `*` to ignore patterns:
```shell
IGNORE="*_schema db*"
```

With patterns you can even ignore all databases (at first)
```shell
IGNORE="*"
```

and then selectively add them via `REQUIRE` (see below).

### 1.2.4 Whitelisting (Requiring)
If you need to make sure that a specific (or many specific) database(s) must be dumped regardless, add it space-separated to this variable. If the specified databases cannot be dumped (no access rights, missing, whatever reason), the dump script will throw an error which is catchable by cron as well as by the included nagios script.

This option is here to make sure you will be informed, that your desired database was not dumped.
```shell
REQUIRED="mysql databaseX databaseY"
#REQUIRED=""
```

**Note**: All databases that have been ignored by `IGNORE` and are specified in `REQUIRE` will be dumped explicitly.
This has the advantage that you can also tell *mysqldump-secure* to dump nothing by default and only choose which database to backup.



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

All valid *tmpwatch*/*tmpreaper* unit values can be used (and are validated). You could also write the following to delete everything older than 30 days:
```shell
DELETE=30d
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

### 1.2.8 Conditional mysqldump options

You can conditionally decide when to apply mysqldump `--quick` option depending on the database size. The default is to only apply `--quick` to databases equal to or greater than 200 MB. (Note: the value is specified in MegaBytes):
```shell
MYSQL_OPTS_QUICK_MIN_SIZE=200
```

Also all consistency/transactional arguments are specified per case.

**Case 1: DB contains only InnoDB tables engines**

1. use `--single-transaction`
2. use nothing

**Case 2: DB contains InnoDB and other table-engines**

1. use `--single-transaction`
2. use `--lock-tables`
3. use nothing

**Case 3: DB contains no InnoDB table-engines at all**

1. use `--lock-tables`
2. use nothing



### 1.2.9 Nagios output log
It is possible to fully integrate the backup procedure into a nagios/icinga environment. For that to use you will need to enable Nagios Logging, which will then create a special logfile that is overwritten every time the dump is triggered.
The Nagios Log file can be used by [check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure) to integrate the current state into nagios.

Open [/etc/mysqldump-secure.conf](https://github.com/cytopia/mysqldump-secure/blob/master/etc/mysqldump-secure.conf) and set the following variables
```shell
NAGIOS_LOG=1
NAGIOS_LOGFILE="/var/log/mysqldump-secure.nagios.log"
```
See [Plugin Readme](https://github.com/cytopia/check_mysqldump-secure) for further instructions and a variety of screenshots.

### 1.2.10 Info file per database
You can enable/disable (enabled by default) the creation of info files. They are stored in the same location as the dumps with the same filename suffixed with `.info`. Those files contain the following information:
```shell
; mysqldump-secure backup record
; Do not alter this file!
; Creation of this file can be turned off via config file.

; Information about the info file
[info]
unix = 1457917635
tz   = CET (+0100)
date = 2016-03-14
time = 02:07:15
host = macbook.local
user = root

[file]
file_path  = /var/mysqldump-secure
file_name  = 2016-03-14_02-07__mysql.sql
file_size  = 482878 Bytes (0.46 MB)
file_mtime = 1457917635 (2016-03-14 02:07:15 CET [+0100])
file_ctime = 1457917635 (2016-03-14 02:07:15 CET [+0100])
file_md5   = f28959ab9488ae1f9e9a06b25c4b0b27
file_sha   = 7ed5e78127686479f3ee6f65d3993634a93221d6497f9694b9d82b65edcdded6

[settings]
encrypted  = 0
compressed = 0
mysqldump  = --opt --default-character-set=utf8 --events --triggers --routines --hex-blob --complete-insert --extended-insert --compress --lock-tables  --skip-quick

[compression]
bin =
arg =

[encryption]
aes_arg =
rsa_pem =

[connection]
protocol  = 127.0.0.1 via TCP/IP
secured   = SSL: Cipher in use is DHE-RSA-AES256-GCM-SHA384
arguments = --defaults-file=/etc/mysqldump-secure.cnf --ssl-ca=/etc/mysql.ca.pem

[server]
host    = macbook.local
port    = 13306
type    = master
version = MariaDB 10.1.11-MariaDB-log Homebrew

[database]
db_name = mysql
db_size = 685890 Bytes (0.65 MB)
tbl_cnt = 30

[tables]
column_stats = MyISAM
columns_priv = MyISAM
# ...
# all tables with their corresponding engine
# output cutted to safe space
```


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
