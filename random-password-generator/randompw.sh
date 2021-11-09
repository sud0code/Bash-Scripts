#!/bin/bash

echo "Enter Password Length: "

read -r len

echo "No. of Passwords to be generated:"

read -r num

echo "Generating $num, $len-character password"
echo ""

for ((n=0;n<$num;n++))

do dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-$len
	
done
