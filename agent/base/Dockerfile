ARG FROM
FROM ${FROM}

# install packeges
RUN yum -y install net-snmp rsyslog hostname sudo && yum clean all
# for node configuration management
#RUN yum -y install net-snmp-utils && yum clean all

RUN systemctl enable snmpd.service || chkconfig snmpd on

EXPOSE 24005/udp 161/udp

# remote debug
EXPOSE 4001/tcp
