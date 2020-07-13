#!/bin/bash

SERVICE=$1

HINEMOS_VER=${HINEMOS_MAJOR}.${HINEMOS_MINOR}
JRE_TAG=openjdk${JAVA_VER}-${OS}

docker build -t hinemos-${SERVICE}-base:${JRE_TAG} ${SERVICE}/base --build-arg FROM=openjdk-${OS}:${JAVA_VER}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-${SERVICE}-${HINEMOS_VER}:${JRE_TAG} ${SERVICE}/package --build-arg FROM=hinemos-${SERVICE}-base:openjdk${JAVA_VER}-${OS} --build-arg MAJOR=${HINEMOS_MAJOR} --build-arg MINOR=${HINEMOS_MINOR}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker-compose build ${SERVICE}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
