# mysqldump-secure

## 1. Installation

### 1.1 Download

Download via git or composer
```shell
# Make sure to clone recursively to also get the submodules
git clone --recursive https://github.com/cytopia/mysqldump-secure.git
```

```shell
composer create-project cytopia/mysqldump-secure
```

### 1.2 Automated installation
Automated installation and setting of access rights via `unix Makefile`.
```shell
sudo make install
```

### 1.3 Manual installation
If you do not trust the `Makefile` you can also manually copy the files and adjust the file permissions by hand.
```shell
# Copy the script
cp bin/mysqldump-secure /usr/local/sbin/mysqldump-secure
chmod +x /usr/local/sbin/mysqldump-secure

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

