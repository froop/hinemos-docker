FROM centos:8.4.2105
#FROM centos:8.3.2011

# yum repo
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

# CentOS 8.5.2111 (final)
#RUN dnf -y update \
# && dnf clean all

# locale
ENV LANG ja_JP.UTF-8
RUN dnf -y install glibc-locale-source langpacks-ja \
 && dnf clean all \
 && echo LANG=$LANG > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
