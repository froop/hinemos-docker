FROM frooprogrammer/openjdk-centos7jp:1.8.0 AS builder

RUN yum -y install java-1.8.0-openjdk-devel \
 && yum clean all

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
RUN ant -f HinemosCommon/build.xml
RUN ant -f HinemosManager/build.xml all_quick

# Multi-stage
FROM frooprogrammer/hinemos-manager-restored-6.2.2-openjdk1.8.0-centos7jp
COPY --from=builder /root/hinemos/HinemosManager/build/jar/HinemosManager.jar /opt/hinemos/lib
COPY --from=builder /root/hinemos/HinemosManager/build/jar/HinemosManagerRhel.jar /opt/hinemos/lib
RUN chown hinemos:hinemos /opt/hinemos/lib/HinemosManager.jar
RUN chown hinemos:hinemos /opt/hinemos/lib/HinemosManagerRhel.jar
