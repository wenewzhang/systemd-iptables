#!/bin/sh
iptables -I OUTPUT -p tcp --dport 25  -j DROP