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

docker build -t hinemos-web-base images/web-base
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
docker build -t hinemos-web:6.2.2 images/web-6.2.2
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker-compose build web
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
