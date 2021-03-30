#!/bin/sh
iptables -I FORWARD -p tcp --dport 25 -j DROP 