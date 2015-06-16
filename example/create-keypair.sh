#!/bin/sh
#
# Create 2048 bit public/private keypair

openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout mysqldump-secure.priv.pem \
	-out mysqldump-secure.pub.pem
