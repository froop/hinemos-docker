#!/bin/bash -eu

systemctl stop hinemos_manager
systemctl start hinemos_pg

/opt/hinemos/sbin/mng/hinemos_clear_tmp.sh
/opt/hinemos/sbin/mng/hinemos_delete.sh -J
/opt/hinemos/sbin/mng/hinemos_delete.sh -E
/opt/hinemos/sbin/mng/hinemos_delete.sh -S
/opt/hinemos/sbin/mng/hinemos_delete.sh -P
/opt/hinemos/sbin/mng/hinemos_delete.sh -L

/opt/hinemos/sbin/mng/hinemos_backup.sh
mv hinemos_pgdump.* hinemos_pgdump
