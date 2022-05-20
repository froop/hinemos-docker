FROM oraclelinux:8.5

# locale
RUN dnf -y install glibc-langpack-ja \
 && dnf clean all
ENV LANG ja_JP.UTF-8
RUN echo LANG=$LANG > /etc/locale.conf

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && rm -f /etc/localtime \
 && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
