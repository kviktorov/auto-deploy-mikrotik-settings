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
