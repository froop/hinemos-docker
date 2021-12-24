FROM quay.io/centos/centos:stream9

# locale
ENV LANG ja_JP.UTF-8
RUN dnf -y install glibc-locale-source langpacks-ja \
 && dnf clean all
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN echo 'LANG=ja_JP.UTF-8' > /etc/locale.conf

# timezone
RUN dnf -y reinstall tzdata && dnf clean all # workaround
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
