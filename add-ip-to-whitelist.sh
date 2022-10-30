#!/bin/sh
[ -z "$1" ] && { echo "./add-ip-to-whitelist.sh <ip>"; exit; }
Find=$(ipset -L |grep $1)
[ -n "$Find" ] && { echo "This ip already in ipset! ($1)"; exit; }
ipset add whitelist $1
echo $1 >> whitelist.txt