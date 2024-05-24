#!/bin/sh
cp usr/bin/daily-clean.sh /usr/bin/.
chmod +x /usr/bin/daily-cleanup.sh
crontab -l | { cat; echo "* 3 * * *     /usr/bin/daily-cleanup.sh"; } | crontab -
