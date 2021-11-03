FROM rockylinux/rockylinux:8.4

#RUN yum -y update && yum clean all

# locale
ENV LANG ja_JP.utf8
RUN dnf -y install glibc-locale-source langpacks-ja
RUN echo 'LANG=ja_JP.utf8' > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
