#!/bin/bash

SERVICE=$1

export HINEMOS_VER=${HINMEOS_MAJOR}.${HINEMOS_MINOR}
export JRE_TAG=openjdk${JAVA_VER}-${OS}
export VERSION_TAG=${HINEMOS_VER}-${JRE_TAG}

docker build -t ${OS} base/${OS}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t openjdk-${OS}:${JAVA_VER} base/openjdk-redhat --build-arg VERSION=${JAVA_VER} --build-arg OS=${OS}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-${SERVICE}-base:${JRE_TAG} base/${SERVICE}-base --build-arg FROM=openjdk-${OS}:${JAVA_VER}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-${SERVICE}:${VERSION_TAG} base/${SERVICE}-package --build-arg FROM=hinemos-${SERVICE}-base:openjdk${JAVA_VER}-${OS} --build-arg MAJOR=${HINMEOS_MAJOR} --build-arg MINOR=${HINEMOS_MINOR}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

# args: VERSION_TAG
docker-compose build ${SERVICE}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
