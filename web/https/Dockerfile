ARG FROM
FROM ${FROM}

EXPOSE 443/tcp

ARG DOCKER_HOST_IP
RUN keytool -genkey -alias tomcat -keyalg RSA -keystore /opt/hinemos_web/.keystore -validity 3650 -storetype PKCS12 -storepass changeit -dname "cn=Hinemos Web Client" -ext SAN=ip:${DOCKER_HOST_IP},ip:172.31.1.12 \
 && sed -i -z 's|<Connector port="80"[^>]*>||' /opt/hinemos_web/conf/server.xml \
 && sed -i -z 's|<!--\(\s*<Connector port="443"[^>]*>\)\s*-->|\1|' /opt/hinemos_web/conf/server.xml
