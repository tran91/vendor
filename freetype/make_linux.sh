#!/bin/sh
set -e

BUILD_DIR=build/linux

mkdir -p $BUILD_DIR

mkdir -p $BUILD_DIR/Debug
cmake -B$BUILD_DIR/Debug -H. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -DFT_WITH_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=TRUE -DCMAKE_INSTALL_PREFIX=../build/linux/debug/freetype
make install -C $BUILD_DIR/Debug

mkdir -p $BUILD_DIR/Release
cmake -B$BUILD_DIR/Release -H. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DFT_WITH_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=TRUE -DCMAKE_INSTALL_PREFIX=../build/linux/release/freetype
make install -C $BUILD_DIR/Release
