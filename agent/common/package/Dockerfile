ARG FROM
FROM ${FROM}

# Hinemos Version
ARG MAJOR
ARG MINOR

RUN HINEMOS_MANAGER=manager \
  yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-agent-${MAJOR}.${MINOR}-1.el.noarch.rpm \
  && yum clean all
