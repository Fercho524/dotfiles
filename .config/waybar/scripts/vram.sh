#!/bin/sh

vram_usage=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits | awk -F, '{print $1 "/" $2 " MB"}')

echo "  $vram_usage"