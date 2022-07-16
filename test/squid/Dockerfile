FROM frooprogrammer/centos7jp:latest
EXPOSE 3128/tcp

RUN yum -y install squid && yum clean all
RUN systemctl enable squid
