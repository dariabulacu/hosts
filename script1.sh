#!/bin/bash
ip_verificare(){
nume_host=$1
ip_nou=$2
dns_server=$3
ip_obtinut=$(nslookup $nume_host $dns_server | grep "Address" | tail -n 1 | awk '{print $2}')
if [[ "$ip_obtinut" != "$ip_nou" ]]; then
    echo "Bogus IP pentru $nume_host în /etc/hosts!"
fi 

}
cat /etc/hosts | while read line; do
  ip=$(echo $line |cut -d ' ' f1)
  name=$(echo $line |cut -d ' ' f2)
ip_verificare( $ip $name "8.8.8.8")
done
