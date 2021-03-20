# bash_mikrotik mikrotik watchdog on
# Ansible versions older than 2.10 do not support RouterOS 6.48 and newer, so I had to do the task on bash.
# script auto send CLI comand to turn on watchdog via ssh, with login parametres and password (yes, i know that is not secured, ut this project allowed for this possibility, since # it was not possible to pre-upload keys to remote devices) on Mikrotik RBR750. The ip address is taken from the list ip_addresses.txt.
