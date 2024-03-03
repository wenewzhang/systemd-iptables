#!/bin/sh
echo $1 >> ./logs
rm systemd-iptables.tar.gz
## echo yes | cp whitelist.txt whitelist.txt.bak
tar czf systemd-iptables.tar.gz .
sftp root@$1 <<EOF
mkdir /root/systemd-iptables
cd /root/systemd-iptables
put sys*.tar.gz
quit
EOF

