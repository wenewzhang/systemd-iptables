#!/bin/bash

# Define the SQLite database file and the input text file
DB_FILE="./etc/chnip_db.db"
INPUT_FILE="./etc/chnip.txt"

# Create the SQLite database and the table
sqlite3 "$DB_FILE" <<EOF
CREATE TABLE IF NOT EXISTS ip_addresses (
    ip TEXT PRIMARY KEY
);
CREATE INDEX IF NOT EXISTS idx_ip ON ip_addresses (ip);
EOF

# Load IPs from the input file and insert into the database
while IFS= read -r ip; do
    # Check if the line is not empty
    if [[ -n "$ip" ]]; then
        sqlite3 "$DB_FILE" <<EOF
INSERT OR IGNORE INTO ip_addresses (ip) VALUES ('$ip');
EOF
    fi
done < "$INPUT_FILE"

echo "IPs have been loaded into the database."
