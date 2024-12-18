#!/bin/sh
## echo yes | cp whitelist.txt whitelist.txt.bak
sftp root@$1 <<EOF
mkdir /etc/whitelist-ssl
cd /etc/whitelist-ssl
put *
put .env .env.new
cd /root/systemd-iptables
lcd huge
put whitelist.txt.huge whitelist.txt
quit
EOF
