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

docker build -t hinemos-agent-base agent-base
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker build -t hinemos-agent:6.2.2 agent-6.2.2
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

docker-compose build agent
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
