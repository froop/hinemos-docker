ARG FROM
FROM ${FROM}

# hinemos version
ARG MAJOR
ARG MINOR
ARG DISTRIBUTION

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-web-${MAJOR}.${MINOR}-1.${DISTRIBUTION}.x86_64.rpm \
  && yum clean all

# for https
#RUN sed -i -z 's|<Connector port="80"[^>]*>||' /opt/hinemos_web/conf/server.xml
#RUN sed -i -z 's|<!--\(\s*<Connector port="443"[^>]*>\)\s*-->|\1|' /opt/hinemos_web/conf/server.xml
#COPY ssl/secure/.keystore /opt/hinemos_web/
