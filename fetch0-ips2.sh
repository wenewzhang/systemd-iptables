#!/bin/sh
./ubuntu-summary.sh |awk '{print $2}'|awk -F. '{print $1"."$2"."$3"/"24}'|sort|uniq
