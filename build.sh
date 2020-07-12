#!/bin/bash

./build_manager.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

./build_agent.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

./build_web.sh
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
