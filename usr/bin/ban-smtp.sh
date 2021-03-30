#!/bin/sh
iptables -I FORWARD 1 -p tcp --dport 25 -j DROP 