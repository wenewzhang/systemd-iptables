# iptables/ip6tables systemd configuration

Example of a persistent firewall based on systemd for Debian Jessie.

### Install Steps
```sh
cp -r etc/iptables /etc/iptables
cp -r etc/systemd/system/iptables.service /etc/systemd/system/
cp -r etc/systemd/system/ip6tables.service /etc/systemd/system/

systemctl daemon-reload

systemctl enable iptables.service
systemctl enable ip6tables.service

systemctl start iptables.service
systemctl start ip6tables.service
```

### Ban smtp
```
cp usr/bin/* /usr/bin/.
chmod +x /usr/bin/allow-smtp.sh
chmod +x /usr/bin/ban-smtp.sh
cp -r etc/systemd/system/bansmtp.service /etc/systemd/system/
systemctl enable bansmtp.service
systemctl start bansmtp.service
```

git clone https://github.com/wenewzhang/systemd-iptables
goSeasBox server Install on debian 10
```
apt update
apt upgrade -y
apt install git vnstat net-tools iftop shadowsocks-libev fail2ban  ipset -y
systemctl disable shadowsocks-libev --now
git clone https://github.com/wenewzhang/systemd-iptables.git

```

on Debian 12
```
apt install libmbedcrypto7
ln -s /usr/lib/x86_64-linux-gnu/libmbedcrypto.so.2.28.3 /usr/lib/x86_64-linux-gnu/libmbedcrypto.so.3
```
