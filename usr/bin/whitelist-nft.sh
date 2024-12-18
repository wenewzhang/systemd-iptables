#!/bin/sh
 /usr/sbin/nft -f /usr/bin/whitelist.nft
while read -r ip; do
  /usr/sbin/nft add element ip filter whitelist { $ip }
done < /etc/whitelist-http/whitelist.txt