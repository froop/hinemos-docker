#!/bin/bash

./manager/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

./agent/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

./web/build.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
