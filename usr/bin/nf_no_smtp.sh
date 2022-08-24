#!/bin/sh
iptables-legacy -I OUTPUT -p tcp --dport 25  -j DROP