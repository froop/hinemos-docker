ARG FROM
FROM ${FROM}

RUN yum -y install sudo cronie rsyslog unzip openssh-server openssh-clients \
    && yum clean all

COPY apply_patches.sh /tmp/
