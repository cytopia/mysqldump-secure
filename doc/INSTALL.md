[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
Installation |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---

# mysqldump-secure Installation

## Download

Download via git or composer
```shell
# Make sure to clone recursively to also get the submodules
git clone --recursive https://github.com/cytopia/mysqldump-secure.git
```

```shell
composer create-project cytopia/mysqldump-secure
```

## Automated installation
Automated installation and setting of access rights via `unix Makefile`.
```shell
sudo make install
```

## Manual installation
If you do not trust the `Makefile` you can also manually copy the files and adjust the file permissions by hand.
```shell
# Copy the script
cp bin/mysqldump-secure /usr/local/sbin/mysqldump-secure
chmod +x /usr/local/bin/mysqldump-secure

# Copy the config files
cp config/mysqldump-secure.conf /etc/mysqldump-secure.conf
chmod 400 /etc/mysqldump-secure.conf

cp config/mysqldump-secure.cnf /etc/mysqldump-secure.cnf
chmod 400 /etc/mysqldump-secure.cnf

# Create the backup dir
mkdir -p /shared/backup/databases
chmod 700 /shared/backup/databases

# Create the logfile (optionally)
touch /var/log/mysqldump-secure.log
chmod 600 /var/log/mysqldump-secure.log
```

