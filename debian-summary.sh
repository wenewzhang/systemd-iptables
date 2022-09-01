#!/bin/sh
cat /var/log/daemon.log |grep ss-server|grep Accepting|awk '{print $5,$12,$15}'|sort|uniq
