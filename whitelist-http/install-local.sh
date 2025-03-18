#!/bin/sh
mkdir /etc/whitelist-http
cp whitelist-http.* /etc/whitelist-http/.
cp .env.new  /etc/whitelist-http/.
cp deploy-env.sh /etc/whitelist-http/.
cp add*.sh /etc/whitelist-http/.
cp install*.sh /etc/whitelist-http/.
cd /etc/whitelist-http
./deploy-env.sh .env.new  > /etc/whitelist-http/.env
touch /etc/whitelist-http/whitelist.txt
touch /etc/whitelist-http/blacklist.txt
./install-service.sh