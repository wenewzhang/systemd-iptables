#!/bin/sh
while read -r ip; do
  sed -i 's/$ip/d' $2
done < $1
