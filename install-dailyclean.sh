#!/bin/sh
cp ./usr/bin/daily-clean.sh /usr/bin/.
chmod +x /usr/bin/daily-clean.sh
crontab -l | { cat; echo "* 3 * * *     /usr/bin/daily-clean.sh"; } | crontab -
