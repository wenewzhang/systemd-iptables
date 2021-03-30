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

