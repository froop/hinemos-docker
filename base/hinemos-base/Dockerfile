ARG FROM
FROM ${FROM}

RUN yum -y install sudo cronie rsyslog unzip && yum clean all

COPY apply_patches.sh /tmp/
