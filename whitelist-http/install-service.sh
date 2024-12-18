#!/bin/sh
cp -r /etc/whitelist-http/whitelist-http.service /etc/systemd/system/
systemctl enable whitelist-http.service
[ -f /sbin/ipset ] && ln -s /sbin/ipset /usr/sbin/ipset
tar xvf whitelist-http.tar.gz
