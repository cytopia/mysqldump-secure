[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
Encryption |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md)

---


# Encryption/Decrption

## Create public/private key

In order to initially generate the public/private keys, use the bundles shell script [create-keypair.sh](https://github.com/cytopia/mysqldump-secure/blob/master/bin/create-keypair.sh). This creates a 2048bit pair as follows:
```shell
openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout mysqldump-secure.priv.pem \
	-out mysqldump-secure.pub.pem
```

