#!/bin/bash

cat /etc/hosts | while read line; do
	ip=$(echo $line | awk '{print $1}')
	name=$(echo $line | awk '{print $2}')
	if [[ -n "$name" && -n "$ip" ]]; then 
		true_ip=$(nslookup + short $name)
		if [[ "$true_ip" != "$ip" ]]; then 
			echo "Bogus IP for $name in /etc/hosts/!"
		fi
	fi
done


