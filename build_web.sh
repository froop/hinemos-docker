#!/bin/bash

docker build -t centos7jp centos7jp
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t openjdk-centos7:8 openjdk-centos7 --build-arg VERSION=8
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-web-base web-base
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
docker build -t hinemos-web:6.2.2 web-6.2.2
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker-compose build web
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
