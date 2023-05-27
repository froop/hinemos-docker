FROM oraclelinux:9

# locale
RUN dnf -y install glibc-locale-source \
 && dnf clean all
ENV LANG ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP $LANG \
 && echo LANG=$LANG > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
