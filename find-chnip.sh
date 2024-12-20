#!/bin/bash

# Define the SQLite database file
DB_FILE="./etc/chnip_db.db"

# Check if the IP address is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

# Get the input IP address
input_ip="$1"

# Query to find similar IPs (e.g., same first two octets)
similar_ips=$(sqlite3 "$DB_FILE" <<EOF
SELECT ip FROM ip_addresses WHERE ip LIKE '${input_ip%.*}.%';
EOF
)

# Output the results
if [ -z "$similar_ips" ]; then
    echo "No similar IPs found."
else
    echo "Similar IPs to $input_ip:"
    echo "$similar_ips"
fi
