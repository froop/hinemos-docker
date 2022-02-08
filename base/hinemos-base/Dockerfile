ARG FROM
FROM ${FROM}

RUN yum -y install initscripts unzip openssh-server openssh-clients net-snmp rsyslog vim-common hostname sudo \
 && yum clean all

RUN systemctl enable snmpd.service || chkconfig snmpd on

COPY apply_patches.sh /tmp/
