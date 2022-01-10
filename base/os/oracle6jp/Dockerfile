FROM oraclelinux:6.10

# locale
ENV LANG ja_JP.UTF-8
RUN yum reinstall -y glibc-common \
 && yum clean all \
 && localedef -f UTF-8 -i ja_JP $LANG \
 && echo LANG=$LANG > /etc/locale.conf \
 && echo "export LANG=${LANG}" >> /root/.bash_profile

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
