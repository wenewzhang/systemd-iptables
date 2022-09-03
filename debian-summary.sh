#!/bin/sh
cat /var/log/daemon.log |grep ss-server|grep Accepting|awk '{print $15,$12}'|sort|uniq
