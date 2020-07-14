#!/bin/bash

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log'
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

/opt/hinemos/sbin/mng/hinemos_change_listen_address.sh 0.0.0.0
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl stop -w -t 90 -s -D /opt/hinemos/var/data -m fast'
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
