FROM amazonlinux:2

#RUN yum -y update && yum clean all
RUN yum -y install glibc-langpack-ja && yum clean all

# locale
ENV LANG ja_JP.UTF-8
RUN echo LANG=ja_JP.UTF-8 > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
    && rm -f /etc/localtime \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
