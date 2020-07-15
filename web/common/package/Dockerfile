ARG FROM
FROM ${FROM}

# hinemos version
ARG MAJOR
ARG MINOR

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-web-${MAJOR}.${MINOR}-1.el7.x86_64.rpm \
  && yum clean all
