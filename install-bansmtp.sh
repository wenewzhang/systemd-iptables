#!/bin/sh
cp usr/bin/* /usr/bin/.
chmod +x /usr/bin/allow-smtp.sh
chmod +x /usr/bin/ban-smtp.sh
cp -r etc/systemd/system/bansmtp.service /etc/systemd/system/
systemctl enable bansmtp.service
systemctl start bansmtp.service
