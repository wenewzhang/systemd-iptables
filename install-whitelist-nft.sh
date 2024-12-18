#!/bin/sh
if [ -f "/usr/sbin/ipset" ]; then
    apt remove ipset iptables
fi
apt install nftables
cp usr/bin/whitelist.nft /usr/bin/.
cp -r etc/systemd/system/whitelist-nft.service /etc/systemd/system/
systemctl enable whitelist-nft.service
systemctl start whitelist-nft.service
echo "success"