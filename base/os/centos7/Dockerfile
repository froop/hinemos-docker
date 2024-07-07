FROM centos:7.9.2009
#FROM centos:7.8.2003
#FROM centos:7.7.1908

# yum repo
RUN sed -i "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-Base.repo \
 && sed -i "s|#baseurl=http://mirror\.centos\.org/centos/\$releasever|baseurl=http://vault.centos.org/centos/7|g" /etc/yum.repos.d/CentOS-Base.repo
# local yum repogitory
#COPY CentOS-Base.repo /etc/yum.repos.d/

# systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
