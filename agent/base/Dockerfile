ARG FROM
FROM ${FROM}

# install packeges
RUN yum -y install net-snmp sudo && yum clean all

RUN systemctl enable snmpd.service || chkconfig snmpd on

EXPOSE 24005/udp 161/udp

# remote debug
EXPOSE 4001/tcp
