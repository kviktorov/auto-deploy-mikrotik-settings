# bash_mikrotik mikrotik watchdog on
# Ansible versions older than 2.10 do not support RouterOS 6.48 and newer, so I had to do the task on bash.
# script auto send CLI comand to turn on watchdog via ssh, with login parametres and password (yes, i know that is not secured, ut this project allowed for this possibility, since # it was not possible to pre-upload keys to remote devices) on Mikrotik RBR750. The ip address is taken from the list ip_addresses.txt.

#!/bin/bash

IFS=$'\n'
for entry in $(cat /root/ip_adresses.txt)
do
IFS=\n
for value in $entry
do
if ping -c 1 $value &> /dev/null
then
sshpass -p 0 ssh  -o StrictHostKeyChecking=no admin@$value '/system watchdog set watch-address=10.188.8.1 watchdog-timer=yes ping-start-after-boot=30m'
echo "Complete:       $value"
else
echo "Not available:  $value"
fi
done
done
