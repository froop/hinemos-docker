#!/bin/bash

./run_sql.sh delete_SNMPTRAP_DEFAULT.sql
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi

rm -rf /opt/hinemos/sbin/db_init
