FROM frooprogrammer/centos7jp:latest
EXPOSE 53/udp
EXPOSE 53/tcp

RUN yum -y install bind bind-utils && yum clean all

# 参考: https://qiita.com/Higemal/items/6de23765797e18c428d7
COPY named.conf /etc/
COPY test.local /var/named/
COPY test.local.rev /var/named/
RUN chgrp named /etc/named.conf

RUN systemctl enable named

WORKDIR /root
