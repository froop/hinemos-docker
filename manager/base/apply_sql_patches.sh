#!/bin/bash -eu

cd $1
shopt -s nullglob
for sql in ./*.sql
do
	echo run $sql
	/tmp/common/run_sql.sh $sql
done
