FROM oraclelinux:8.5

# locale
ENV LANG ja_JP.UTF-8
RUN dnf -y install glibc-locale-source langpacks-ja \
 && dnf clean all \
 && echo LANG=$LANG > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]

# etc
RUN dnf -y install tar \
 && dnf clean all
