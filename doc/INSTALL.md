[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
Installation |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---

# mysqldump-secure Installation

## 1. OSX

### 1.1 Stable version

```shell
brew tap cytopia/tap
brew install mysqldump-secure
```
Or in one line
```shell
brew install cytopia/tap/mysqldump-secure
```

### 1.2 Latest development version

```shell
brew tap cytopia/tap
brew install --HEAD mysqldump-secure
```
Or in one line
```shell
brew install --HEAD cytopia/tap/mysqldump-secure
```

## 2. Linux, BSD and OSX

### 2.1 Download

**Download Tarball**
```shell
wget https://github.com/cytopia/mysqldump-secure/archive/0.15.tar.gz -O - | tar -xz
cd mysqldump-secure
```
**Download via git**
```shell
git clone https://github.com/cytopia/mysqldump-secure.git
cd mysqldump-secure
git checkout 0.15
```
**Download via composer**
```shell
composer create-project cytopia/mysqldump-secure
cd mysqldump-secure
```

### 2.2 Configure
Configure for system default location
```shell
./configure
```
Configure to custom location (e.g.: `/usr/local`)
```shell
./configure --prefix=/usr/local
```

### 2.3 Build and install
```shell
make
sudo make install
```


### 3. Checking

Once mysqldump-secure is install you should run the self-test which tells you all about the stuff that is wrong or missing. By default only the mysql connection will fail and the rest will be auto-configured:
```shell
mysqldump-secure --test
```
