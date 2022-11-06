ARG FROM
FROM ${FROM}

EXPOSE 443/tcp

ARG DOCKER_HOST_IP
RUN keytool -genkey -alias tomcat -keyalg RSA -keystore /opt/hinemos_web/.keystore -storetype PKCS12 -storepass changeit -dname "cn=hinemos" -ext SAN=ip:${DOCKER_HOST_IP} \
 && sed -i -z 's|<Connector port="80"[^>]*>||' /opt/hinemos_web/conf/server.xml \
 && sed -i -z 's|<!--\(\s*<Connector port="443"[^>]*>\)\s*-->|\1|' /opt/hinemos_web/conf/server.xml
