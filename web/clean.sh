#!/bin/bash -u

. .env

export REPOSITORY=$REPOSITORY
export OS_IMAGE=$OS_IMAGE
export JAVA_IMAGE=$JAVA_IMAGE
export HINEMOS_MAJOR=$WEB_MAJOR
export HINEMOS_MINOR=$WEB_MINOR
export HINEMOS_TAG=$WEB_TAG

common/clean_common.sh web
