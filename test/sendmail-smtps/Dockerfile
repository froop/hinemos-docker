FROM frooprogrammer/centos7jp:latest
EXPOSE 465

RUN yum -y install sendmail sendmail-cf mailx && yum clean all

WORKDIR /etc/mail
COPY key.pem certs/
COPY cert.pem certs/
COPY ca.pem certs/

RUN ln -s ca.pem certs/`openssl x509 -noout -hash < certs/ca.pem`.0

RUN echo "define(\`CERT_DIR',\`/etc/mail/certs')dnl" >> sendmail.mc
RUN echo "define(\`confCACERT_PATH',\`CERT_DIR')dnl" >> sendmail.mc
RUN echo "define(\`confCACERT',\`CERT_DIR/ca.pem')dnl" >> sendmail.mc
RUN echo "define(\`confSERVER_CERT',\`CERT_DIR/cert.pem')dnl" >> sendmail.mc
RUN echo "define(\`confSERVER_KEY',\`CERT_DIR/key.pem')dnl" >> sendmail.mc
RUN echo "define(\`confCLIENT_CERT',\`CERT_DIR/cert.pem')dnl" >> sendmail.mc
RUN echo "define(\`confCLIENT_KEY',\`CERT_DIR/key.pem')dnl" >> sendmail.mc
RUN echo "define(\`confTLS_SRV_OPTIONS', \`V')dnl" >> sendmail.mc
RUN echo "DAEMON_OPTIONS(\`Port=smtps, Name=TLSMTA, M=s')dnl" >> sendmail.mc
RUN m4 sendmail.mc > sendmail.cf

RUN adduser user01
RUN adduser user02

WORKDIR /root
