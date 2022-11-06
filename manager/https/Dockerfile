ARG FROM
FROM ${FROM}

EXPOSE 8443/tcp 8444/tcp 8445/tcp

ARG DOCKER_HOST_IP
RUN keytool -genkey -keyalg RSA -keystore /root/keystore -validity 3650 -storetype PKCS12 -storepass hinemos -dname "cn=Hinemos Manager" -ext SAN=ip:${DOCKER_HOST_IP},ip:172.31.1.10

#COPY https_address.sql /tmp/patch/
COPY https_address_v7.sql /tmp/patch/
