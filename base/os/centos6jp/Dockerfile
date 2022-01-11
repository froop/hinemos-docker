FROM centos:6.10

# yum repo
RUN sed -i "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-Base.repo \
 && sed -i "s|#baseurl=http://mirror\.centos\.org/centos/\$releasever|baseurl=http://vault.centos.org/centos/6.10|g" /etc/yum.repos.d/CentOS-Base.repo

# locale
ENV LANG ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
 && echo LANG=$LANG > /etc/locale.conf \
 && echo "export LANG=${LANG}" >> /root/.bash_profile

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
  && rm -f /etc/localtime \
  && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# services
CMD ["/sbin/init"]
