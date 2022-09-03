#!/bin/sh
cat /var/log/syslog |grep ss-server|grep Accepting|awk '{print $15,$12}'|sort|uniq
