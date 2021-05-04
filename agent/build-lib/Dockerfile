FROM frooprogrammer/openjdk-devel-centos7jp:8 AS builder

RUN yum -y install git wget \
 && yum clean all

ENV JAVA_HOME /usr
ENV ANT_HOME /usr/local/ant
ENV PATH ${PATH}:${ANT_HOME}/bin

RUN wget https://ftp.jaist.ac.jp/pub/apache/ant/binaries/apache-ant-1.10.10-bin.tar.gz
RUN tar -zxvf apache-ant-1.10.10-bin.tar.gz
RUN mv apache-ant-1.10.10 ${ANT_HOME}

WORKDIR /root
ARG BRANCH
COPY lastupdate.txt ./
RUN git clone -b ${BRANCH} https://github.com/froop/hinemos.git

WORKDIR hinemos
COPY AgentWS.jar HinemosManager/build/jar/
RUN ant -f HinemosCommon/build.xml
RUN ant -f HinemosWorkers/build_agent.xml

# Multi-stage
FROM frooprogrammer/hinemos-agent-base-6.2.2-openjdk8-centos7jp
COPY --from=builder /root/hinemos/HinemosWorkers/build/jar/HinemosAgent.jar /opt/hinemos_agent/lib
