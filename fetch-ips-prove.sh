#!/bin/sh
cat /var/log/daemon.log |grep auth |awk '{print $13}'|awk -F. '{print $1"."$2"."$3".0/"24}'|sort|uniq > _blacklist.txt
cat /var/log/daemon.log.1 |grep auth |awk '{print $13}'|awk -F. '{print $1"."$2"."$3".0/"24}'|sort|uniq >> _blacklist.txt
cat _blacklist.txt | sort | uniq >> blacklist.txt