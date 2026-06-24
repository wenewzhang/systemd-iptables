#!/bin/sh

# Function to remove the nftables table
remove_table() {
    nft delete table ip accounting
    echo "Removed nftables table 'accounting'."
}

# Check for arguments
if [ "$1" = "remove" ]; then
    remove_table
    exit 0
fi

nft add table ip accounting

nft add set ip accounting inputcounters '{ type ipv4_addr; flags dynamic; size 65535; }'
nft add chain ip accounting input '{ type filter hook input priority 0; policy accept; }'
nft add rule ip accounting input add @inputcounters '{ ip saddr counter }'
nft add rule ip accounting input ip saddr @inputcounters

nft add set ip accounting outputcounters '{ type ipv4_addr; flags dynamic; size 65535; }'
nft add chain ip accounting output '{ type filter hook output priority 0; policy accept; }'
nft add rule ip accounting output add @outputcounters '{ ip daddr counter }'
nft add rule ip accounting output ip daddr @outputcounters