FROM registry.access.redhat.com/ubi8/ubi-init:8.5

# locale
RUN dnf -y install glibc-locale-source \
 && dnf clean all
ENV LANG ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP $LANG
RUN echo LANG=$LANG > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
