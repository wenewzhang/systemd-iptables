#!/bin/sh
while read -r ip; do
  sed -i "/$ip/d" $2
done < $1
