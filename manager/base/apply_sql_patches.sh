#!/bin/bash -eu

shopt -s nullglob
for sql in ./*.sql
do
	echo run $sql
	/tmp/common/run_sql.sh "$sql"
	rm -f "$sql"
done
