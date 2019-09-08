#!/bin/sh
set -e

BUILD[0]=zip
BUILD[1]=png
BUILD[2]=jpeg
BUILD[3]=freetype

for i in "${BUILD[@]}"
do
	cd $i
	bash make_$1.sh
	cd ..
done
