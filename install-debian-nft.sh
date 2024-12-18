#!/bin/sh
apt install git vnstat net-tools iftop shadowsocks-libev fail2ban nftables -y
systemctl disable shadowsocks-libev --now
./install-whitelist-nft.sh
./opt-tcp-files.sh

### fix for debian 11, same as debian 12
cp -rf shadowsocks-libev-server@.service /usr/lib/systemd/system/shadowsocks-libev-server@.service
