#!/bin/sh
crontab -l | { cat; echo "*/1 * * * *     /usr/sbin/iftop -tnN -s 30 >> /var/log/traffic.log"; } | crontab -
