#!/bin/bash -u

. .env

export OS=$OS
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$MANAGER_MAJOR
export HINEMOS_MINOR=$MANAGER_MINOR
export HINEMOS_TAG=$MANAGER_TAG

common/clean_common.sh manager
