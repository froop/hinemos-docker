#!/bin/bash -eu

. .env

export OS_IMAGE=$OS_IMAGE
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$WEB_MAJOR
export HINEMOS_MINOR=$WEB_MINOR
export DISTRIBUTION=$WEB_DIST
export ARCHITECTURE=$WEB_ARCH

common/build_common.sh web
