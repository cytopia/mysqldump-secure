[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
Requirements |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---


# Requirements

| Program  | Required | Description |
| ------------- | ------------- | -------- |
| bourne shell (sh)  | yes  | The whole script is written in pure bourne shell (sh) and is 100% Posix compliant |
| [mysql](https://dev.mysql.com/downloads/mysql/)  | yes  | The mysql binary is used to find all available databases and their corresponding size |
| [mysqldump](https://dev.mysql.com/downloads/mysql/)  | yes  | This is used for the actual dump procedure |
| [openssl](https://www.openssl.org)  | optional  | Optionally used for private/public key encrypting the database dump |
| [gzip](http://www.gzip.org)  | optional  | Optionally used for compressing the database dump |
| [pigz](http://zlib.net/pigz/)  | optional  | Optionally used for compressing the database dump (multithreaded) |
| [bzip2](http://www.bzip.org/)  | optional  | Optionally used for compressing the database dump |
| [pbzip2](http://compression.ca/pbzip2/)  | optional  | Optionally used for compressing the database dump (multithreaded) |
| [xz](http://www.bzip.org/)  | optional  | Optionally used for compressing the database dump |
| [lzma](http://tukaani.org/lzma/)  | optional  | Optionally used for compressing the database dump |
| [lzop](http://www.lzop.org/)  | optional  | Optionally used for compressing the database dump |
| [tmpwatch](https://fedorahosted.org/tmpwatch/)  | optional  | Optionally used to delete old database dumps |
| [tmpreaper](https://packages.debian.org/sid/tmpreaper)  | optional  | Optionally used to delete old database dumps |
| [check_mysqldump-secure](https://github.com/cytopia/check_mysqldump-secure)  | optional  | Optionally used to monitor the dump via nagios (already bundled as a submodule inside this repository) |
