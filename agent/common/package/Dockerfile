ARG FROM
FROM ${FROM}

# Hinemos Version
ARG MAJOR
ARG MINOR
ARG DISTRIBUTION

RUN HINEMOS_MANAGER=manager \
  yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-agent-${MAJOR}.${MINOR}-1.${DISTRIBUTION}.noarch.rpm \
  && yum clean all

# for https
#RUN sed -i "s|http://manager:8081|https://manager:8444|" /opt/hinemos_agent/conf/Agent.properties
