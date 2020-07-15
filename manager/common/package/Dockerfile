ARG FROM
FROM ${FROM}

# Hinemos Version
ARG MAJOR
ARG MINOR

WORKDIR /tmp/patch
COPY run_sql.sh common/
COPY initdb/* initdb/

WORKDIR initdb
RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-manager-${MAJOR}.${MINOR}-1.el7.x86_64.rpm \
  && yum clean all \
  && ./initdb.sh

# VOLUME /opt/hinemos/var/data

# enable remote debug
RUN sed -i "s/#\(.* -Xdebug \)/\1/" /opt/hinemos/etc/hinemos.cfg
