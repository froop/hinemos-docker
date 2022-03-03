FROM centos:8.4.2105
#FROM centos:8.3.2011

# yum repo
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

# locale
ENV LANG ja_JP.UTF-8
RUN dnf -y install glibc-locale-source langpacks-ja
RUN echo 'LANG=ja_JP.UTF-8' > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
