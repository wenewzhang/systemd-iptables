#!/bin/sh
apt install git vnstat net-tools iftop shadowsocks-libev fail2ban  ipset -y
systemctl disable shadowsocks-libev --now
./install-whitelist.sh
./install-cron.sh
./install-ipt.sh
./opt-tcp-files.sh
./install-bansmtp.sh
