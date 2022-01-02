#!/bin/bash -eu

. .env

export REPOSITORY=$REPOSITORY
export OS_IMAGE=$OS_IMAGE
export JAVA_IMAGE=$JAVA_IMAGE
export HINEMOS_MAJOR=$WEB_MAJOR
export HINEMOS_MINOR=$WEB_MINOR
export DISTRIBUTION=$WEB_DIST
export ARCHITECTURE=$WEB_ARCH
export LOCAL_IP=$LOCAL_IP

common/build_common.sh web
