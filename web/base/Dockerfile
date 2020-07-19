ARG FROM
FROM ${FROM}

RUN yum -y install vlgothic-p-fonts && yum clean all || : # For CentOS 7 or earlier

EXPOSE 80

CMD ["/sbin/init"]
