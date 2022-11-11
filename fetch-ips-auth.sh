#!/bin/sh
cat /var/log/auth.log|grep Accepted|grep gsb2|awk '{print $11}'|sort|uniq|awk -F. '{print $1"."$2"."$3".0/"24}'
