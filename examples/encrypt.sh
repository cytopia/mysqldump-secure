#!/bin/sh

usage() {
	echo "Usage: ${0} pubkey inputfile"
}


if [ $# -ne 2 ]; then
	echo "Invalid number of arguments."
	usage
	exit 1
fi
if [ ! -f "${1}" ]; then
	echo "pubkey ${1} not found,"
	usage
	exit 1
fi
if [ ! -f "${2}" ]; then
	echo "inputfile ${2} not found,"
	usage
	exit 1
fi


openssl smime -encrypt -binary -text -aes256 \
	-in "${2}" \
	-out "${2}.enc" \
	-outform DER "${1}"

if [ $? -ne 0 ]; then
	exit 1
else
	exit 0
fi

