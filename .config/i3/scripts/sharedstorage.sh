#!/bin/bash
partition="sda2"

df -h 2>/dev/null  > /tmp/sharedstr.tmp 
cat /tmp/sharedstr.tmp | grep $partition | cut -d G -f 3

rm /tmp/sharedstr.tmp 