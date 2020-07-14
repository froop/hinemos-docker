#!/bin/bash

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS}

docker build -t hinemos-${SERVICE}-base:${JRE_TAG} ${SERVICE}/base --build-arg FROM=hinemos-base:openjdk${JAVA_VER}-${OS}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-${SERVICE}-${HINEMOS_MAJOR}.x:${JRE_TAG} ${SERVICE}/${HINEMOS_MAJOR}/base --build-arg FROM=hinemos-${SERVICE}-base:${JRE_TAG}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${JRE_TAG} ${SERVICE}/package --build-arg FROM=hinemos-${SERVICE}-${HINEMOS_MAJOR}.x:openjdk${JAVA_VER}-${OS} --build-arg MAJOR=${HINEMOS_MAJOR} --build-arg MINOR=${HINEMOS_MINOR}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker-compose build ${SERVICE}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
