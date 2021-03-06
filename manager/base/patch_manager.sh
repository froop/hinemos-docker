#!/bin/bash -eu

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log'

export PGPASSWORD=hinemos
/tmp/apply_patches.sh
/tmp/apply_sql_patches.sh

su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl stop -w -t 90 -s -D /opt/hinemos/var/data -m fast'
