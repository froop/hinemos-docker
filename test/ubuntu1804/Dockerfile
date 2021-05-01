FROM ubuntu:18.04

RUN apt update \
 && apt install -y --no-install-recommends \
    openjdk-8-jre \
 && apt -y clean

WORKDIR /root

RUN apt update \
 && apt install -y --no-install-recommends \
    wget \
 && wget "https://github.com/hinemos/hinemos/releases/download/v6.2.2/hinemos-6.2-agent-6.2.2-1.ubuntu.noarch.deb" \
 && apt -y --purge remove \
    wget \
 && apt -y clean \
 && HINEMOS_MANAGER=manager \
    dpkg -i hinemos-6.2-agent-6.2.2-1.ubuntu.noarch.deb \
 && rm -f hinemos-6.2-agent-6.2.2-1.ubuntu.noarch.deb

RUN mkdir /var/lock/subsys

CMD service hinemos_agent start \
 && tail -f /dev/null
