#!/bin/bash -eu

systemctl stop hinemos_manager
systemctl start hinemos_pg

/opt/hinemos/sbin/mng/hinemos_clear_tmp.sh
/opt/hinemos/sbin/mng/hinemos_delete.sh -J
/opt/hinemos/sbin/mng/hinemos_delete.sh -E
/opt/hinemos/sbin/mng/hinemos_delete.sh -R
/opt/hinemos/sbin/mng/hinemos_delete.sh -H
/opt/hinemos/sbin/mng/hinemos_delete.sh -D
/opt/hinemos/sbin/mng/hinemos_delete.sh -M
/opt/hinemos/sbin/mng/hinemos_delete.sh -Z

/opt/hinemos/sbin/mng/hinemos_backup.sh
mv hinemos_pgdump.* hinemos_pgdump
