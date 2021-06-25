#!/bin/bash -u

. .env

export OS_IMAGE=$OS_IMAGE
export JAVA_IMAGE=$JAVA_IMAGE
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$MANAGER_MAJOR
export HINEMOS_MINOR=$MANAGER_MINOR
export HINEMOS_TAG=$MANAGER_TAG

docker rmi ${REPOSITORY}/hinemos-manager-restored-${JAVA_IMAGE}${JAVA_VER}-${OS_IMAGE}:${MANAGER_MAJOR}.${MANAGER_MINOR}
common/clean_common.sh manager
