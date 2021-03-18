#!/bin/sh
set -e

WORKSPACE="${POD_NAME}_Example.xcworkspace"
SCHEME="${POD_NAME}"
FRAMEWORK_NAME="${POD_NAME}"

BUILD_DIR="Build"
TMP_DIR="${BUILD_DIR}/Tmp"
IOS_ARCHIVE_PATH="${TMP_DIR}/iOS.xcarchive"
IOS_SIM_ARCHIVE_PATH="${TMP_DIR}/iOSSimulator.xcarchive"

rm -rf ${BUILD_DIR}
rm -rf "${FRAMEWORK_NAME}.xcframework"

xcodebuild archive \
 -workspace "Example/${WORKSPACE}" \
 -scheme ${SCHEME} \
 -archivePath ${IOS_SIM_ARCHIVE_PATH} \
 -sdk iphonesimulator \
 SKIP_INSTALL=NO \
 | xcpretty


 xcodebuild archive \
 -workspace "Example/${WORKSPACE}" \
 -scheme ${SCHEME} \
 -archivePath ${IOS_ARCHIVE_PATH} \
 -sdk iphoneos \
 SKIP_INSTALL=NO \
 | xcpretty

 xcodebuild -create-xcframework \
 -framework ${IOS_SIM_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
 -framework ${IOS_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
 -output ${FRAMEWORK_NAME}.xcframework \
 | xcpretty

zip ${FRAMEWORK_NAME}.xcframework.zip ${FRAMEWORK_NAME}.xcframework

rm -rf ${BUILD_DIR}