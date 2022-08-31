#!/bin/sh
cat /var/log/syslog |grep ss-server|grep Accepting|grep -v message|awk '{print $5,$12,$15}'|sort|uniq
