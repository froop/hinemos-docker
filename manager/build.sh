#!/bin/bash

. .env

export OS=$OS
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$MANAGER_MAJOR
export HINEMOS_MINOR=$MANAGER_MINOR

common/build_common.sh manager