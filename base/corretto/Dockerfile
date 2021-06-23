ARG FROM
FROM ${FROM}

ARG VERSION
RUN amazon-linux-extras enable corretto8
RUN yum -y install java-${VERSION}-amazon-corretto && yum clean all
