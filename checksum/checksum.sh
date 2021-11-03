#!/bin/bash


MD5=$(md5sum $1 | tr -d $1)
SHA1=$(sha1sum $1 | tr -d $1)
SHA2=$(sha256sum $1 | tr -d $1)

echo "MD5: $MD5"
echo "SHA1: $SHA1"
echo "SHA2: $SHA2"
