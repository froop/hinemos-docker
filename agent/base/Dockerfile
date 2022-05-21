ARG FROM
FROM ${FROM}

# install packeges
RUN yum install -y net-snmp-utils chkconfig \
 && yum clean all

EXPOSE 24005/udp 161/udp

# remote debug
EXPOSE 4001/tcp
