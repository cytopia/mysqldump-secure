#!/bin/sh
#
# Create 2048 bit public/private keypair

openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout mysqldump-secure.priv.pem \
	-out mysqldump-secure.pub.pem

if [ $? -ne 0 ]; then
	exit 1
else
	exit 0
fi
