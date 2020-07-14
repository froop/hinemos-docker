#!/bin/bash

. .env

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

docker build -t hinemos-base:openjdk${JAVA_VER}-${OS} base/hinemos-base --build-arg FROM=openjdk-${OS}:${JAVA_VER}
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
