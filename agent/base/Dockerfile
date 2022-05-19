ARG FROM
FROM ${FROM}

# install packeges
RUN yum install -y chkconfig \
 && yum clean all
#RUN yum -y install net-snmp-utils && yum clean all # suggested

EXPOSE 24005/udp 161/udp

# remote debug
EXPOSE 4001/tcp
