ARG FROM
FROM ${FROM}

# install packeges
RUN yum -y install rsyslog net-snmp && yum clean all

RUN systemctl enable snmpd.service || chkconfig snmpd on

EXPOSE 24005/udp 161/udp
