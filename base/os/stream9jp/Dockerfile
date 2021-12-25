FROM quay.io/centos/centos:stream9

# locale
RUN dnf -y install langpacks-ja \
 && dnf clean all
ENV LANG ja_JP.UTF-8
RUN echo LANG=$LANG > /etc/locale.conf

# timezone
RUN dnf -y reinstall tzdata && dnf clean all # workaround
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
