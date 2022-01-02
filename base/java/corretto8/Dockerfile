ARG FROM
FROM ${FROM}

ARG VERSION
RUN amazon-linux-extras enable corretto8
RUN yum -y install java-1.8.0-amazon-corretto && yum clean all
