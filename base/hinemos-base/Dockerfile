ARG FROM
FROM ${FROM}

RUN yum -y install initscripts unzip openssh-server openssh-clients net-snmp rsyslog vim-common hostname sudo \
 && yum clean all

RUN systemctl enable snmpd.service || chkconfig snmpd on
#RUN echo "rocommunity public" >> /etc/snmp/snmpd.conf # for AL2022

COPY apply_patches.sh /tmp/
