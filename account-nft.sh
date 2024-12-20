#!/bin/sh
current_date=$(date +"%Y-%m-%d")

# Print the date
echo $current_date
filename="traffic-"$current_date
nft list set accounting inputcounters|grep 'bytes'|awk -F ',' '{print $1 $2}'|awk -F ' ' '{print $7,$12}' > $filename
nft list set accounting inputcounters|grep 'bytes'|awk -F ',' '{print $1 $2}'|awk -F ' ' '{print $1,$6}'  >> $filename
cat $filename