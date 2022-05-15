#!/bin/bash -u

. .env

export REPOSITORY=$REPOSITORY
export OS_IMAGE=$OS_IMAGE
export JAVA_IMAGE=$JAVA_IMAGE
export HINEMOS_MAJOR=$MANAGER_MAJOR
export HINEMOS_MINOR=$MANAGER_MINOR
export HINEMOS_TAG=$MANAGER_TAG

docker rmi -f ${REPOSITORY}/hinemos-manager-restored-${JAVA_IMAGE}-${OS_IMAGE}:${MANAGER_MAJOR}.${MANAGER_MINOR}
common/clean_common.sh manager
