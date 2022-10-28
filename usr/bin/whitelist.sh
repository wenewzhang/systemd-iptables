#!/bin/sh
ipset create whitelist hash:net counters comment maxelem 1000000
iptables -I INPUT -p tcp --dport 22  -j ACCEPT
iptables -A INPUT  -m set --match-set whitelist src -j ACCEPT
iptables -A INPUT DROP
ipset add whitelist 113.218/16