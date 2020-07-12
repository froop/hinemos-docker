#!/bin/bash

export OS=centos7jp
#export OS=amzn2jp
export JAVA_VER=8
export HINMEOS_MAJOR=6.2
export HINEMOS_MINOR=2

base/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

manager/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

agent/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

web/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
