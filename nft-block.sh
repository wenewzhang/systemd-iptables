#!/bin/sh
[ -z "$1" ] && { echo "Usage: ./nft-block.sh <ip>"; exit 1; }
nft add element ip filter blacklist "{ $1 }"
