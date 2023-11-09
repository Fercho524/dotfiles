#!/bin/bash

free | awk '/Mem/ {printf " %d / %d MiB\n", $3 / 1024.0, $2 / 1024.0, $1 }'