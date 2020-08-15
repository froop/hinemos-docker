ARG FROM
FROM ${FROM}

RUN yum -y install rsyslog unzip && yum clean all

COPY apply_patches.sh /tmp/
