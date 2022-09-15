#!/bin/bash
get_ip(){
    local IP=$( ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | egrep -v "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\.|^0\." | head -n 1 )
    [ -z ${IP} ] && IP=$( wget -qO- -t1 -T2 ipv4.icanhazip.com )
    [ -z ${IP} ] && IP=$( wget -qO- -t1 -T2 ipinfo.io/ip )
    [ ! -z ${IP} ] && echo ${IP} || echo
}

function choose_from_menu() {
    local prompt="$1" outvar="$2"
    shift
    shift
    local options=("$@") cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e") # cache ESC as test doesn't allow esc codes
    printf "$prompt\n"
    while true
    do
        # list all options (option list is zero-based)
        index=0 
        for o in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then echo -e " >\e[7m$o\e[0m" # mark & highlight the current option
            else echo "  $o"
            fi
            index=$(( $index + 1 ))
        done
        read -s -n3 key # wait for user to key in arrows or ENTER
        if [[ $key == $esc[A ]] # up arrow
        then cur=$(( $cur - 1 ))
            [ "$cur" -lt 0 ] && cur=0
        elif [[ $key == $esc[B ]] # down arrow
        then cur=$(( $cur + 1 ))
            [ "$cur" -ge $count ] && cur=$(( $count - 1 ))
        elif [[ $key == "" ]] # nothing, i.e the read delimiter - ENTER
        then break
        fi
        echo -en "\e[${count}A" # go up to the beginning to re-render
    done
    # export the selection to the requested output variable
    printf -v $outvar "${options[$cur]}"
}

protocols=(
"tcp_only"
"tcp_and_udp"
)

choose_from_menu "Please make a choice:" PROTOCOL "${protocols[@]}"
echo "Selected choice: $PROTOCOL"

crypts=(
"aes-256-cfb"
"aes-256-gcm"
)

choose_from_menu "Please make a choice:" CRYPT "${crypts[@]}"
echo "Selected choice: $CRYPT"

ports=(
"8501"
"8502"
"1861"
"1862"
"1863"
"1864"
"1865"
"1866"
"1867"
"1868"
"1869"
"1871"
"1872"
"1873"
"1874"
"1875"
"1876"
"1877"
"1878"
"1879"
)

choose_from_menu "Please make a choice:" PORT "${ports[@]}"
echo "Selected choice: $PORT"


passs=(
"simple"
"complex"
)

choose_from_menu "Please make a choice:" PASS "${passs[@]}"
echo "Selected choice: $PASS"


IP=$(get_ip)
if [ $PASS == 'simple' ]; then
  PWD=${RANDOM} 
else
  PWD=$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-12} | head -n 1)
fi

cat > /etc/shadowsocks-libev/con$PORT.json <<EOF
{
    "server":["$IP"],
    "mode":"$PROTOCOL",
    "server_port":$PORT,
    "password":"$PWD",
    "timeout":60,
    "method":"$CRYPT",
    "local_address":"$IP",
    "nameserver":"8.8.8.8",
    "fast_open": true
}
EOF

systemctl enable shadowsocks-libev-server@con$PORT.service --now