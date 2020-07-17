#!/bin/bash -eu

cd $1
for sql in ./*.sql
do
	echo run $sql
	/tmp/common/run_sql.sh $sql
done
