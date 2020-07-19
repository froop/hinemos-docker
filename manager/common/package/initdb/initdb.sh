#!/bin/bash -eu

# delete monitor_id: SNMPTRAP_DEFAULT
#su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log'
#../common/run_sql.sh delete_SNMPTRAP_DEFAULT.sql
#su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl stop -w -t 90 -s -D /opt/hinemos/var/data -m fast'

rm -rf /opt/hinemos/sbin/db_init
