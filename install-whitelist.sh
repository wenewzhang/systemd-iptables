#!/bin/sh
cp usr/bin/whitelist.sh /usr/bin/.
chmod +x /usr/bin/whitelist.sh
cp -r etc/systemd/system/whitelist.service /etc/systemd/system/
systemctl enable whitelist.service
systemctl start whitelist.service
