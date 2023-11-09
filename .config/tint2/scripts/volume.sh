#!/bin/bash

pamixer --get-volume-human | awk '{printf "󰕿 %s\n",$1 }'