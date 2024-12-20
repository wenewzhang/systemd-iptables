#!/bin/sh

# Define the IP to check and the China IP range file
ip_to_check=$1 # Replace with the IP you want to check
china_ip_ranges="./etc/chnip.txt"  # File containing China IP ranges

# Function to convert IP to a numeric value
ip_to_num() {
    local a b c d
    a=$(echo "$1" | awk -F. '{print $1}')
    b=$(echo "$1" | awk -F. '{print $2}')
    c=$(echo "$1" | awk -F. '{print $3}')
    d=$(echo "$1" | awk -F. '{print $4}')
    echo $((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))
}

ip_num=$(echo "$ip_to_check" | awk -F'.' '{print $1*256^3 + $2*256^2 + $3*256 + $4}')
start_time=$(date +%s.%N)
found=0
# Check if the IP falls within any China range
while read -r network_range; do
    #network=$(echo "$network_range" | awk -F'/' '{print $1}')
    #prefix=$(echo "$network_range" | awk -F'/' '{print $2}')
    network=${network_range%%/*}
    prefix=${network_range##*/}
    #network=$(echo "$network_range" | cut -d'/' -f1)
    #prefix=$(echo "$network_range" | cut -d'/' -f2)
    network_num=$(echo "$network" | awk -F'.' '{print $1*256^3 + $2*256^2 + $3*256 + $4}')
    mask_num=$((0xFFFFFFFF << (32 - prefix)))
    echo $network_num $mask_num
    
    # Check if the IP address is within the network range
    if [ $((ip_num & mask_num)) -eq $((network_num & mask_num)) ]; then
        echo "$ip_to_check is from China $network_range"
        found=1
        break
    fi
done < "$china_ip_ranges"

if [ "$found" -eq 0 ]; then
  echo "$ip_to_check is not from China"
fi
end_time=$(date +%s.%N)
runtime=$( echo "$end_time - $start_time" | bc -l )
echo "Script took $runtime seconds to run."