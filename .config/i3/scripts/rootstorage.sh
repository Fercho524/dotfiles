#!/bin/bash
rootpartition="sda3"

df -h 2> /dev/null > /tmp/rootstr.tmp 
cat /tmp/rootstr.tmp | grep $rootpartition | cut -d G -f 3

rm /tmp/rootstr.tmp