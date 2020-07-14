#!/bin/bash

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log'
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

./run_sql.sh delete_SNMPTRAP_DEFAULT.sql
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl stop -w -t 90 -s -D /opt/hinemos/var/data -m fast'
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

rm -rf /opt/hinemos/sbin/db_init
