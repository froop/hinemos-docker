#!/bin/bash

docker build -t centos7jp images/centos7jp
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t openjdk-centos7:8 images/openjdk-centos7 --build-arg VERSION=8
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-manager-base images/manager-base
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-manager:6.2.2 images/manager-6.2.2
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker-compose build manager
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
