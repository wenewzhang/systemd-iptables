#!/bin/sh
mkdir /etc/whitelist-http
cp whitelist-http.* /etc/whitelist-http/.
cp .env .env.new  /etc/whitelist-http/.
cp deploy-env.sh /etc/whitelist-http/.
cp add*.sh /etc/whitelist-http/.
cp install*.sh /etc/whitelist-http/.

