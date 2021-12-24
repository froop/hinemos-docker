FROM registry.access.redhat.com/ubi7/ubi-init:7.9

# locale
ENV LANG ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN echo 'LANG=ja_JP.UTF-8' > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
  && rm -f /etc/localtime \
  && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
