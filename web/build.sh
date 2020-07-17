#!/bin/bash -eu

. .env

export OS=$OS
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$WEB_MAJOR
export HINEMOS_MINOR=$WEB_MINOR

common/build_common.sh web
