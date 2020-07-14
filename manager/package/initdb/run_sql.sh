#!/bin/bash

sql_file=$1

PGPASSWORD=hinemos /opt/hinemos/postgresql/bin/psql -p 24001 --set ON_ERROR_STOP=on -U hinemos -d hinemos -f $sql_file
status=$?
if [ $status -ne 0 ]; then
  exit $status
fi
