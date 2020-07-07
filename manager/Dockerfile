FROM manager-base

# Hinemos Version
ENV MAJOR 6.2
ENV MINOR 2

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-manager-${MAJOR}.${MINOR}-1.el7.x86_64.rpm && yum clean all

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-agent-${MAJOR}.${MINOR}-1.el.noarch.rpm && yum clean all

VOLUME /opt/hinemos/var/data
