#!/bin/bash -eu

. .env

export OS_IMAGE=$OS_IMAGE
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$WEB_MAJOR
export HINEMOS_MINOR=$WEB_MINOR
export DISTRIBUTION=$WEB_DIST
export ARCHITECTURE=x86_64

common/build_common.sh web
