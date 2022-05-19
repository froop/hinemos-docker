FROM frooprogrammer/centos7

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
