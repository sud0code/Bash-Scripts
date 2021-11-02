#!/bin/bash
clear
cat << EOF
Select Option:

    1. Encrypt file
    2. Decrypt file
    0. Quit

EOF
echo -n 'Enter selection [0-2]: '
read -r sel

case $sel in
	0) echo "Quitting...";;
		
	1) echo "Enter the file name with extension to encrypt"
            read -r file
            gpg -c "$file"
            echo "File, $file encrypted succesfully!"

	    read -p "Delete plaintext file? (y/n)" choice
                case "$choice" in
                y|Y ) rm -rf "$file"
			echo "Plaintext file deleted!";;
                n|N ) exit 1;;
                * ) echo "invalid choice(choose y/n)";;
		esac;;
        
        2) echo "Enter the file name with extension to Decrypt"
            read -r file
            gpg -d "$file".gpg > $file
            echo "File decrypted!"

	    read -p "Delete encrypted file? (y/n)" choice
		case "$choice" in 
  		y|Y ) rm -rf "$file".gpg
			echo "Encrypted file deleted!";;
  		n|N ) exit 1;;
		* ) echo "invalid choice(choose y/n)";;
		esac;;
esac

