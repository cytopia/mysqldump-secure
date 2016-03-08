[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Requirements](https://github.com/cytopia/mysqldump-secure/blob/master/doc/REQUIREMENTS.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
Encryption |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---


# Encryption/Decrption

## Create public/private key

In order to initially generate the public/private keys, use the bundles shell script [create-keypair.sh](https://github.com/cytopia/mysqldump-secure/blob/master/bin/create-keypair.sh). This creates a 2048bit pair as follows:
```shell
openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout mysqldump-secure.priv.pem \
	-out mysqldump-secure.pub.pem
```

## Key performance

You can test the performance on your target machine yourself with:
```shell
openssl speed rsa512
```

Values on my machine are

|               | rsa 512  | rsa 1024 | rsa 2048 | rsa 4096 |
|---------------|---------:|---------:|---------:|---------:|
| # of sign/s   |  6,878.4 |  2,075.8 |    398.8 |     66.4 |
| # of verify/s | 99,898.4 | 42,966.3 | 15,396.4 |  4,751.5 |
