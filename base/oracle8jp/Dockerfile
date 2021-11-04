FROM oraclelinux:8.4

#RUN yum -y update && yum clean all

# locale
RUN dnf -y install glibc-langpack-ja && yum clean all
ENV LANG ja_JP.utf8
RUN echo 'LANG=ja_JP.utf8' > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]

# etc
RUN dnf -y install tar && yum clean all
