#!/bin/sh
set -e

BUILD_DIR=build/ios
ROOT_DIR=$(pwd)
PROJECT_NAME=freetype

mkdir -p $BUILD_DIR
cmake -H. -B$BUILD_DIR -GXcode -DFT_WITH_ZLIB=ON -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=TRUE -DIOS_LIBRARY_PREIX=../build/ios

cd $BUILD_DIR

xcodebuild -target $PROJECT_NAME -sdk iphoneos ONLY_ACTIVE_ARCH=NO IPHONEOS_DEPLOYMENT_TARGET='7.0' -configuration Release OTHER_CFLAGS="-fembed-bitcode"
xcodebuild -target $PROJECT_NAME -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO IPHONEOS_DEPLOYMENT_TARGET='7.0' -configuration Release OTHER_CFLAGS="-fembed-bitcode"

xcodebuild -target $PROJECT_NAME -sdk iphoneos ONLY_ACTIVE_ARCH=NO IPHONEOS_DEPLOYMENT_TARGET='7.0' -configuration Debug
xcodebuild -target $PROJECT_NAME -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO IPHONEOS_DEPLOYMENT_TARGET='7.0' -configuration Debug

cd $ROOT_DIR

mkdir -p ../build/ios/release/freetype/lib
mkdir -p ../build/ios/debug/freetype/lib

lipo -create -output ../build/ios/release/freetype/lib/lib$PROJECT_NAME.a $BUILD_DIR/Release-iphoneos/lib$PROJECT_NAME.a $BUILD_DIR/Release-iphonesimulator/lib$PROJECT_NAME.a
lipo -create -output ../build/ios/debug/freetype/lib/lib$PROJECT_NAME.a $BUILD_DIR/Debug-iphoneos/lib$PROJECT_NAME.a $BUILD_DIR/Debug-iphonesimulator/lib$PROJECT_NAME.a
