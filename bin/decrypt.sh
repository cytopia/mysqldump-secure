#!/bin/sh

usage() {
	echo "Usage: ${0} privkey encryptedfile"
}


if [ $# -ne 2 ]; then
	echo "Invalid number of arguments."
	usage
	exit 1
fi
if [ ! -f "${1}" ]; then
	echo "privkey ${1} not found,"
	usage
	exit 1
fi
if [ ! -f "${2}" ]; then
	echo "encryptedfile ${2} not found,"
	usage
	exit 1
fi

case "${2}" in
        *.enc) OUT_FILENAME="$(basename "${2}" .enc)";;
        *)     OUT_FILENAME="${2}.decrypted"
esac

openssl smime -decrypt \
	-in "${2}" \
	-binary -inform DEM \
	-inkey "${1}" \
        -out "${OUT_FILENAME}"

if [ $? -ne 0 ]; then
	exit 1
else
	exit 0
fi

