#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m'

clear
echo -e "${CYAN}\t SYSTEM INFORMATION${NC}"

echo -e "Hostname:\t\t"`hostname`
echo -e "uptime:\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//'`
echo -e "Machine Type:\t\t"`vserver=$(lscpu | grep Hypervisor | wc -l); 
	if [ $vserver -gt 0 ]; 
		then echo "Virtual Machine";
	else echo "Physical"; 
	fi`

echo -e "Operating System:\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`

echo -e "Kernel:\t\t\t"`uname -r`

echo -e "Architecture:\t\t"`arch`

echo -e "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`

echo -e "Active Users:\t\t"`whoami`
echo -e "System Main IP:\t\t"`hostname -I`
echo -e "Memory Usage:\t\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
echo -e "Swap Usage:\t\t"`free | awk '/Swap/{printf("%.2f%"), $3/$2*100}'`
echo -e "CPU Usage:\t\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo -e "Disk Usage:\t\t"`df -Ph | grep /dev/`
