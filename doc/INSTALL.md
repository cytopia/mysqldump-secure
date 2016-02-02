[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
Installation |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---

# mysqldump-secure Installation

## OSX

```shell
brew tap cytopia/tap
brew install mysqldump-secure
```

## Linux / BSD

### Download

Download via git, archive or composer
```shell
# Make sure to clone recursively to also get the submodules
git clone --recursive https://github.com/cytopia/mysqldump-secure.git
```

```shell
wget https://github.com/cytopia/mysqldump-secure/archive/master.tar.gz -O - | tar -xz
```

```shell
composer create-project cytopia/mysqldump-secure
```

### Installation

```shell
./configure
make
sudo make install
```

