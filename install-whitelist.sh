#!/bin/sh
if [ -f "/usr/sbin/ipset" ]; then
    cp usr/bin/whitelist.sh /usr/bin/.
    chmod +x /usr/bin/whitelist.sh
    cp -r etc/systemd/system/whitelist.service /etc/systemd/system/
    systemctl enable whitelist.service
    systemctl start whitelist.service
elif [ -f "/sbin/ipset" ]; then 
    mkdir -p /usr/sbin/
    ln -s /sbin/ipset /usr/sbin/ipset
else 
    apt install ipset -y
fi