#!/bin/sh
cp usr/bin/ipt_no_smtp.sh /usr/bin/.
chmod +x /usr/bin/ipt_no_smtp.sh
chmod +x /usr/bin/ipt_no_smtp.sh
cp -r etc/systemd/system/bansmtp-ipt.service /etc/systemd/system/
systemctl enable bansmtp-ipt.service
systemctl start bansmtp-ipt.service
