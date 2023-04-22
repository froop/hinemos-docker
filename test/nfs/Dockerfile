FROM frooprogrammer/centos7jp:latest
EXPOSE 111/tcp
EXPOSE 111/udp
EXPOSE 2049/tcp
EXPOSE 2049/udp

RUN yum -y install nfs-utils && yum clean all

RUN echo '/share/nfs 172.31.1.0/24(rw,no_root_squash,async)' > /etc/exports
RUN mkdir -p /share/nfs
RUN systemctl enable rpcbind
RUN systemctl enable nfs

WORKDIR /root
