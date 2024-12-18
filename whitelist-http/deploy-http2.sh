#!/bin/sh
echo $1 >> ./logs
## echo yes | cp whitelist.txt whitelist.txt.bak
sftp root@$1 <<EOF
mkdir /etc/whitelist-http2
cd /etc/whitelist-http2
put whitelist-http2*
put .env .env.new
put deploy-env.sh
put add*.sh
put install*.sh
quit
EOF
