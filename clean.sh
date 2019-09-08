#!/bin/sh
set -e

BUILD[0]=zip
BUILD[1]=png
BUILD[2]=jpeg
BUILD[3]=freetype

for i in "${BUILD[@]}"
do
	case $1 in
		droid|ios|osx|linux|web)
			rm -rf build/$1
			cd $i
			rm -rf build/$1
			cd ..
			;;
		all)
			rm -rf build
			cd $i
			rm -rf build
			cd ..
			;;
	esac
done
