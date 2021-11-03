#!/bin/bash

echo "Enter file with path for backup: " 
read -r file

echo ""

echo "Enter user and servername (user@serverIP_or_name): "
read -r server

echo ""

echo "Enter backup location on remote server: "
read -r location


rsync -avz -e ssh $file $server:$location/$(date)

