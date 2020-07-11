FROM hinemos-manager-base

# Hinemos Version
ENV MAJOR 6.2
ENV MINOR 2

COPY initdb/* /tmp/initdb/
WORKDIR /tmp/initdb
RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-manager-${MAJOR}.${MINOR}-1.el7.x86_64.rpm && yum clean all \
  && ./initdb.sh

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-agent-${MAJOR}.${MINOR}-1.el.noarch.rpm && yum clean all

# enable remote debug
RUN sed -i "s/#\(.* -Xdebug \)/\1/" /opt/hinemos/etc/hinemos.cfg

WORKDIR /root
