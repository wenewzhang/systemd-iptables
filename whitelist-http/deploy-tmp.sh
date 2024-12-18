#!/bin/sh
## echo yes | cp whitelist.txt whitelist.txt.bak
sftp root@$1 <<EOF
mkdir /etc/whitelist-http
cd /etc/whitelist-http
put add*
quit
EOF
