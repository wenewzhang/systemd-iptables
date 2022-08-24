#!/bin/sh
iptables-legacy -I INPUT -p tcp --dport 25  -j DROP