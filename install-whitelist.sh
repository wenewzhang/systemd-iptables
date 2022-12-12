#!/bin/sh
if [ -f "/usr/sbin/ipset" ]; then
    cp usr/bin/whitelist.sh /usr/bin/.
    chmod +x /usr/bin/whitelist.sh
    cp -r etc/systemd/system/whitelist.service /etc/systemd/system/
    systemctl enable whitelist.service
    systemctl start whitelist.service
    echo "success"
elif [ -f "/sbin/ipset" ]; then 
    mkdir -p /usr/sbin/
    ln -s /sbin/ipset /usr/sbin/ipset
    echo "create ln to sbin"
else 
    apt install ipset -y
    echo "install ipset, do it again!"
fi