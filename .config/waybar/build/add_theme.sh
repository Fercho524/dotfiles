#!/bin/bash

themename=$1

mkdir ./layouts/$themename
cp ./build/assets/layout.jsonc ./layouts/$themename/

mkdir ./styles/$themename
cp ./build/assets/style.css ./styles/$themename/

mkdir ./themes/$themename
cp ./build/assets/run.sh ./themes/$themename/