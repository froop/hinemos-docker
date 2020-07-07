FROM openjdk-centos7:8

RUN yum -y install vim-common net-snmp net-snmp-utils sysstat tcpdump lsof && yum clean all

RUN systemctl enable snmpd.service

EXPOSE 8080/tcp 8081/tcp 8082/tcp 514/tcp 514/udp 162/udp

CMD ["/sbin/init"]
