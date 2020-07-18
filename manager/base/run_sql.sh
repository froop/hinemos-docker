#!/bin/bash -eu

sql_file=$1

PGPASSWORD=hinemos /opt/hinemos/postgresql/bin/psql -p 24001 --set ON_ERROR_STOP=on -U hinemos -d hinemos -f $sql_file
