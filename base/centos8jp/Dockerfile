FROM centos:8

#RUN yum -y update && yum clean all

# locale
ENV LANG ja_JP.utf8
RUN dnf -y install langpacks-ja

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
    && rm -f /etc/localtime \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
