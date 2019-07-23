#/bin/bash

local_ip=$(ifconfig en0 |grep "inet\ " | awk {'print $2'})
inter_ip=$(curl -s https://api.ipify.org)
echo $fg[red]"Local:" $fg[white] $local_ip
echo $fg[red]"Inter:" $fg[white] $inter_ip

