# dump-database
[![Build Status](https://travis-ci.org/cytopia/dump-database.svg?branch=master)](https://travis-ci.org/cytopia/dump-database)

Backup script to dump MySQL databases via cron or command line with additional options for encryption, compression, blacklisting, logging and custom mysqldump parameters.

## Features

**Encryption**

On-the-fly public/private key encryption of database dumps. The advantage of public/private key encryption is
that even if your server is compromised the database dumps cannot be decrypted as it needs the private key which
should be far away in a secure location

**Opt-out / blacklisting**

By default all databases are dumped one by one that you do not accidentally forget to add new databases.
If however you want to exclude certain databases such as for example 'information_schema' you can add them to the IGNORE list

**Dump Options**

You can specify custom mysqldump parameters in the configuration file. The default configuration dumps databases including events, triggers and routines.
The dump is done via 'single-transaction' to also take transactional tables into account and via --quick in case of very large tables.
All those parameters are customizable so alter them as desired.

**Compression**

Databases can be writting to disk via gzip compression in order to save storage

**Logging**

You can turn on logging to file.


**Verbosity**

The verbosity is currently fixed and is quite talkative. Informing you about missing directories, wrong permissions, dumping time, etc. Just have a look at the code.

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



## Quick Start

Copy the config file to /etc and the script itself to any sbin directory.
Make sure that the configuration file can not be read by others as you will need to store the MySQL credentials inside.
```shell
cp dump-database.conf /etc/dump-database.conf
chmod 400 /etc/dump-database.conf

cp dump-database.sh /usr/local/sbin/dump-database.sh
chmod +x /usr/local/sbin/dump-database.sh
```

Make sure to adjust the configuration and create the backup directory and the logfile (optionally).
```
mkdir /shared/backup/databases
touch /var/log/dump-database.log
```

Once you have tested the script you can setup the cronjob like so:
```
# Dump MySQL Databases at 03:15 every day
  15 3  *  *  * /bin/sh /usr/local/sbin/dump-database.sh
```


## Configuration
See [dump-database.conf](dump-database.conf) for all options.



## Contribution
Contributers, issues and merge-requests are highly welcome.
As well as feature requests.


## Todo
The script is currently not POSIX conform as it needs to check the exit codes of piped commands via
```shell
if [ ${PIPESTATUS[0]} -ne 0  ]; then
```
Another approach had been to check:
```shell
pipefail
```
which is unfortunately also not POSIX conform.

There is a solution that currently exists for pure POSIX conform exit code checking on piped commands.
http://cfaj.ca/shell/cus-faq-2.html
```shell
# ...
run() {
	#
}
# ...
```
This however did not work and needs further investigation.



## Licence
The MIT License (MIT)

Copyright (c) 2015 Pantu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
