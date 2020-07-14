ARG FROM_TAG
FROM ${FROM_TAG}

COPY patch/* /tmp/patch/
RUN su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log' \
  && /tmp/apply_patches.sh /tmp/patch \
  && su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl stop -w -t 90 -s -D /opt/hinemos/var/data -m fast'

WORKDIR /root
