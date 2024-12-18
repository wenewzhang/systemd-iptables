#!/bin/sh
echo $1 >> /var/log/whitelist-http.log
VALID=$(echo $1 | grep -E '^[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}$');

if [ ! -n "$VALID" ]; then
   echo "This IP ($1) isn't valid. Please check it and try again." >> /var/log/whitelist-http.log;
   exit 0;
fi;
P1=$(echo $1 | awk -F. '{print $1}')
P2=$(echo $1 | awk -F. '{print $2}')
P3=$(echo $1 | awk -F. '{print $3}')
P4=$(echo $1 | awk -F. '{print $4}')
[ "$P1" -gt 255 ] || [ "$P2" -gt 255 ] || [ "$P3" -gt 255 ] || [ "$P4" -gt 255 ] && exit;
IP=$(echo $1 | awk -F. '{print $1"."$2"."$3"."$4"/32"}')

if [ -f "/usr/sbin/ipset" ]; then
   Find=$(/usr/sbin/ipset -L |grep $IP)
   [ -n "$Find" ] && { echo "This ip already in ipset! ($IP)" >> /var/log/whitelist-http.log; } || { /usr/sbin/ipset add whitelist $IP; }
elif [ -f "/usr/sbin/nft" ]; then
   /usr/sbin/nft add element ip accounting inputcounters { $IP }
fi
[ ! -f "/root/systemd-iptables/whitelist.txt" ] && touch /root/systemd-iptables/whitelist.txt;
Find=$( cat /root/systemd-iptables/whitelist.txt | grep $IP )
[ -n "$Find" ] && { echo "This ip already in whitelist! ($IP)" >> /var/log/whitelist-http.log; } || { echo $IP >> /etc/whitelist-http/whitelist.txt; }


