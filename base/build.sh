#!/bin/bash

OS=centos7jp
#OS=amzn2jp
JAVA_VER=8

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
