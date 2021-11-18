FROM centos:6

#RUN yum -y update && yum clean all

# locale
ENV LANG ja_JP.utf8
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
    && rm -f /etc/localtime \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# services
CMD ["/sbin/init"]
