FROM amazonlinux:2023

# locale
RUN yum -y install glibc-langpack-ja \
 && yum clean all
ENV LANG ja_JP.UTF-8
RUN echo LANG=$LANG > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# yum repo for net-snmp
COPY fedora.repo /etc/yum.repos.d/fedora.repo

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
