#!/bin/bash

/opt/hinemos/sbin/mng/hinemos_change_listen_address.sh 0.0.0.0
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
