ARG FROM
FROM ${FROM}

# Hinemos Version
ARG MAJOR
ARG MINOR
ARG DISTRIBUTION

WORKDIR /tmp/initdb
COPY initdb/* ./

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-manager-${MAJOR}.${MINOR}-1.${DISTRIBUTION}.x86_64.rpm \
  && yum clean all \
  && ./initdb.sh

# VOLUME /opt/hinemos/var/data

# enable remote debug
RUN sed -i "s/#\(.* -Xdebug \)/\1/" /opt/hinemos/etc/hinemos.cfg
