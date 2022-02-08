ARG FROM
FROM ${FROM}

# install packeges
# RUN yum -y install net-snmp-utils sysstat tcpdump lsof && yum clean all # suggested

EXPOSE 8080/tcp 8081/tcp 8082/tcp 514/tcp 514/udp 162/udp

# remote debug
EXPOSE 4000/tcp

# JMX
EXPOSE 7100/tcp

COPY run_sql.sh /tmp/common/
COPY apply_sql_patches.sh /tmp/
COPY patch_manager.sh /tmp/
COPY delete_SNMPTRAP_DEFAULT.sql /tmp/patch/
COPY delete_INFRA_FILE_CONTENT.sql /tmp/patch/

# for https (port 8443, 8444)
#COPY ssl/secure/keystore /root/
#COPY ssl/base_ssl_address.sql /tmp/patch/
