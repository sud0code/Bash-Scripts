#!/bin/bash

userfile=$1

username=$(cat  | tr 'A-Z'  'a-z')

password=$username@123

for user in $username
do
       useradd $user
       echo $password | passwd --stdin $user
done

echo "$(wc -l $1) users have been created"
