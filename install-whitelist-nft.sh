#!/bin/sh
if [ -f "/usr/sbin/ipset" ]; then
    apt remove ipset iptables -y
    rm /usr/bin/whitelist.sh
    systemctl disable whitelist.service
    systemctl stop whitelist.service
    rm /etc/systemd/system/whitelist.service
fi
apt install nftables -y
cp usr/bin/whitelist.nft /usr/bin/.
cp usr/bin/whitelist.sh /usr/bin/.
cp -r etc/systemd/system/whitelist-nft.service /etc/systemd/system/
systemctl enable whitelist-nft.service
systemctl start whitelist-nft.service
echo "success"