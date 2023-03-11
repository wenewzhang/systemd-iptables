#!/bin/sh
apt install git ipset shadowsocks-libev
systemctl disable shadowsocks-libev --now
./install-whitelist.sh
./install-cron.sh
./install-ipt.sh
./opt-tcp-files.sh
./install-bansmtp.sh
