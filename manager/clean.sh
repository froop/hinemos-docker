#!/bin/bash -u

. .env

export OS_IMAGE=$OS_IMAGE
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$MANAGER_MAJOR
export HINEMOS_MINOR=$MANAGER_MINOR
export HINEMOS_TAG=$MANAGER_TAG

common/clean_common.sh manager
docker rmi frooprogrammer/hinemos-manager-restored-${MANAGER_MAJOR}.${MANAGER_MINOR}-openjdk${JAVA_VER}-${OS_IMAGE}
