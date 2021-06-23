#!/bin/bash -eu

. .env

export OS_IMAGE=$OS_IMAGE
export JAVA_VER=$JAVA_VER
export JAVA_IMAGE=$JAVA_IMAGE
export HINEMOS_MAJOR=$MANAGER_MAJOR
export HINEMOS_MINOR=$MANAGER_MINOR
export DISTRIBUTION=$MANAGER_DIST
export ARCHITECTURE=$MANAGER_ARCH
export LOCAL_IP=$LOCAL_IP

common/build_common.sh manager

if test -e manager/${MANAGER_MAJOR}/${MANAGER_MINOR}/restore/hinemos_pgdump.zip ; then
  manager/build-restore.sh
fi
