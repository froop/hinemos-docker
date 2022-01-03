FROM quay.io/centos/centos:stream9

# locale
ENV LANG ja_JP.UTF-8
RUN dnf -y install glibc-langpack-ja \
 && dnf clean all \
 && echo LANG=$LANG > /etc/locale.conf

# timezone
RUN dnf -y reinstall tzdata && dnf clean all # workaround
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
