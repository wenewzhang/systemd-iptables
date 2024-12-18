#!/bin/sh
get_ip(){
    local IP=$( ip addr | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -E "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\.|^0\." | head -n 1 )
    [ -z ${IP} ] && IP=$( wget -qO- -t1 -T2 ipv4.icanhazip.com )
    [ -z ${IP} ] && IP=$( wget -qO- -t1 -T2 ipinfo.io/ip )
    [ ! -z ${IP} ] && echo ${IP} || echo
}
IP=$(get_ip)
sed -i "/APP_HOST/d" $1
sed -i "/APP_PORT/d" $1
echo "APP_HOST=$IP" >> $1
echo "APP_PORT=8000" >> $1
cat $1 
