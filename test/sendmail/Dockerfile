FROM frooprogrammer/centos7jp:latest
EXPOSE 25

RUN yum -y install sendmail sendmail-cf mailx && yum clean all

WORKDIR /etc/mail
RUN sed -i 's/^\(DAEMON_OPTIONS.*Port=smtp,Addr=127.0.0.1\)/dnl \1/' sendmail.mc
RUN m4 sendmail.mc > sendmail.cf

RUN adduser user01
RUN adduser user02

WORKDIR /root
