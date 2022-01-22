ARG FROM
FROM ${FROM}

#RUN yum -y install https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.rpm && yum clean all
RUN (amazon-linux-extras enable corretto8 \
     && yum -y install java-1.8.0-amazon-corretto) \
 || (rpm --import https://yum.corretto.aws/corretto.key \
     && curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo \ 
     && yum -y install java-1.8.0-amazon-corretto-devel) \
 && yum clean all
