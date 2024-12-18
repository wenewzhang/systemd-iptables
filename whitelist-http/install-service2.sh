#!/bin/sh
cp -r /etc/whitelist-http2/whitelist-http2.service /etc/systemd/system/
systemctl enable whitelist-http2.service
[ -f /sbin/ipset ] && ln -s /sbin/ipset /usr/sbin/ipset
tar xvf whitelist-http2.tar.gz
