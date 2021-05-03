FROM centos:7.9.2009
#FROM centos:7.8.2003
#FROM centos:7.7.1908

# local yum repogitory
#COPY CentOS-Base.repo /etc/yum.repos.d/

#RUN yum -y update && yum clean all

# locale
ENV LANG ja_JP.utf8
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
    && rm -f /etc/localtime \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
