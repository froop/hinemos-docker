FROM openjdk-centos7:8

RUN yum -y install vim-common net-snmp net-snmp-utils sysstat tcpdump lsof && yum clean all

RUN systemctl enable snmpd.service
