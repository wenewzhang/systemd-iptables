#!/bin/sh
current_date=$(date +"%Y-%m-%d")

# Print the date
echo $current_date
filename="traffic-"$current_date
cachefile="cache.tmp"
nft list set accounting inputcounters|grep 'bytes'|awk -F ',' '{print $1 $2}'|awk -F ' ' '{print $7,$12}' > $cachefile
nft list set accounting inputcounters|grep 'bytes'|awk -F ',' '{print $1 $2}'|awk -F ' ' '{print $1,$6}'  >> $cachefile
cat $cachefile | awk '{
    ip=$1; 
    traffic=$2;
    if (ip ~ /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) {
        print ip, traffic
    }
}' | awk '{
    ip=$1; 
    traffic=$2;
    total[ip] += traffic
} 
END {
    for (ip in total) {
        print ip, total[ip]    }
}'  | sort -k2 -n > $filename.in

nft list set accounting outputcounters|grep 'bytes'|awk -F ',' '{print $1 $2}'|awk -F ' ' '{print $7,$12}' > $cachefile
nft list set accounting outputcounters|grep 'bytes'|awk -F ',' '{print $1 $2}'|awk -F ' ' '{print $1,$6}'  >> $cachefile
cat $cachefile | awk '{
    ip=$1; 
    traffic=$2;
    if (ip ~ /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) {
        print ip, traffic
    }
}' | awk '{
    ip=$1; 
    traffic=$2;
    total[ip] += traffic
} 
END {
    for (ip in total) {
        print ip, total[ip]    }
}'  | sort -k2 -n > $filename.out

cat $filename.in $filename.out |
awk '{
    ip=$1; 
    traffic=$2;
    traffic_mb = traffic / 1048576;
    total[ip] += traffic
} 
END {
    for (ip in total) {
        print ip, total[ip]    }
}' > $filename.total
cat $filename.total