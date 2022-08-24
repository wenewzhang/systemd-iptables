#!/bin/sh
cp usr/bin/* /usr/bin/.
chmod +x /usr/bin/nf_no_smtp.sh
chmod +x /usr/bin/nf_no_smtp.sh
cp -r etc/systemd/system/bansmtp-nf.service /etc/systemd/system/
systemctl enable bansmtp-nf.service
systemctl start bansmtp-nf.service
