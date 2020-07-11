#!/bin/bash

pg_stop() {
  su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl stop -w -t 90 -s -D /opt/hinemos/var/data -m fast'
  status=$?
  if [ $status -ne 0 ]; then
    exit $status
  fi
}

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log'
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

PGPASSWORD=hinemos /opt/hinemos/postgresql/bin/psql -p 24001 --set ON_ERROR_STOP=on -U hinemos -d hinemos -f delete_SNMPTRAP_DEFAULT.sql
status=$?
if [ $status -ne 0 ]; then
  pg_stop
  exit $status
fi

pg_stop

rm -rf /opt/hinemos/sbin/db_init
