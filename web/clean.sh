#!/bin/bash

. .env

export OS=$OS
export JAVA_VER=$JAVA_VER
export HINEMOS_MAJOR=$WEB_MAJOR
export HINEMOS_MINOR=$WEB_MINOR
export HINEMOS_TAG=$WEB_TAG

common/clean_common.sh web