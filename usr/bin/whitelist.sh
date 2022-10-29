#!/bin/sh
ipset create whitelist hash:net counters comment maxelem 1000000
iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 22  -j ACCEPT
# Below 1 line need by wget/apt for dns
iptables -A INPUT -p udp --dport 53  -j ACCEPT
# Below 1 line Need by shadowsocks data packages transfer
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT  -m set --match-set whitelist src -j ACCEPT
ipset add whitelist 113.218.0.0/16


##  iptables -L INPUT -v -n 