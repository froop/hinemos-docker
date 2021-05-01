ARG FROM
FROM ${FROM}

RUN yum -y install unzip openssh-server openssh-clients \
    && yum clean all

COPY apply_patches.sh /tmp/
