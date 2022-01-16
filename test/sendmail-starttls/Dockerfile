FROM frooprogrammer/centos7jp:latest
EXPOSE 25 465 587

RUN yum -y install sendmail sendmail-cf mailx openssl \
 && yum clean all

WORKDIR /etc/mail
COPY secure/key.pem certs/
COPY secure/cert.pem certs/
COPY secure/ca.pem certs/

RUN ln -s ca.pem certs/`openssl x509 -noout -hash < certs/ca.pem`.0

RUN sed -i 's/^\(DAEMON_OPTIONS.*Port=smtp,Addr=127.0.0.1\)/dnl \1/' sendmail.mc \
 && echo "define(\`CERT_DIR',\`/etc/mail/certs')dnl" >> sendmail.mc \
 && echo "define(\`confCACERT_PATH',\`CERT_DIR')dnl" >> sendmail.mc \
 && echo "define(\`confCACERT',\`CERT_DIR/ca.pem')dnl" >> sendmail.mc \
 && echo "define(\`confSERVER_CERT',\`CERT_DIR/cert.pem')dnl" >> sendmail.mc \
 && echo "define(\`confSERVER_KEY',\`CERT_DIR/key.pem')dnl" >> sendmail.mc \
 && echo "define(\`confCLIENT_CERT',\`CERT_DIR/cert.pem')dnl" >> sendmail.mc \
 && echo "define(\`confCLIENT_KEY',\`CERT_DIR/key.pem')dnl" >> sendmail.mc \
 && echo "define(\`confTLS_SRV_OPTIONS', \`V')dnl" >> sendmail.mc \
 && echo "DAEMON_OPTIONS(\`Port=smtp, Name=MTA')dnl" >> sendmail.mc \
 && echo "DAEMON_OPTIONS(\`Port=587, Name=MSA, M=E')dnl" >> sendmail.mc \
 && echo "DAEMON_OPTIONS(\`Port=smtps, Name=TLSMTA, M=s')dnl" >> sendmail.mc \
 && m4 sendmail.mc > sendmail.cf

RUN adduser user01 \
 && adduser user02

WORKDIR /root
