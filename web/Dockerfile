FROM web-base

# hinemos version
ENV MAJOR 6.2
ENV MINOR 2

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${MAJOR}.${MINOR}/hinemos-${MAJOR}-web-${MAJOR}.${MINOR}-1.el7.x86_64.rpm && yum clean all
