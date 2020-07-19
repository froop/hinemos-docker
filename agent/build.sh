#!/bin/bash -eu

. .env

export OS=$OS
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$AGENT_MAJOR
export HINEMOS_MINOR=$AGENT_MINOR
export DISTRIBUTION=$AGENT_DIST

common/build_common.sh agent
