#!/bin/bash

echo "Enter file to path for backup: " 
read -r file

echo ""

echo "Enter user and servername (user@serverIP_or_name): "
read -r server

echo ""

echo "Enter backup location on remote server: "
read -r location

echo "Do you wish to backup again to the same server and location? "
read -r resp0

echo "Do you wish to enable periodic backup to remote server? "
read -r resp1

echo ""
