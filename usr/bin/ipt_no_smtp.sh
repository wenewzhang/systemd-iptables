#!/bin/sh
iptables -I INPUT -p tcp --dport 25  -j DROP