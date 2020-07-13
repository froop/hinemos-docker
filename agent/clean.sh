#!/bin/bash

. .env

export OS=$OS
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$AGENT_MAJOR
export HINEMOS_MINOR=$AGENT_MINOR
export HINEMOS_TAG=$AGENT_TAG

common/clean_common.sh agent
