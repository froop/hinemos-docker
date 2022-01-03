FROM centos:7.9.2009
#FROM centos:7.8.2003
#FROM centos:7.7.1908

# local yum repogitory
#COPY CentOS-Base.repo /etc/yum.repos.d/

# locale
ENV LANG ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP $LANG \
 && sed -i -e "/override_install_langs/s/$/,${LANG}/g" /etc/yum.conf \
 && echo LANG=$LANG > /etc/locale.conf \
 && echo "export LANG=${LANG}" >> /root/.bash_profile

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
