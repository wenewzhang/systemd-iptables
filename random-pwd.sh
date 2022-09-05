#!/bin/sh
cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-12} | head -n 5