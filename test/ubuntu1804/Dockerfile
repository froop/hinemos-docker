FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    tzdata \
    language-pack-ja \
    openjdk-8-jre \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

ENV TZ Asia/Tokyo

RUN update-locale LANG=ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    wget \
 && wget "https://github.com/hinemos/hinemos/releases/download/v6.2.2/hinemos-6.2-agent-6.2.2-1.ubuntu.noarch.deb" \
 && apt-get -y --purge remove \
    wget \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* \
 && HINEMOS_MANAGER=manager \
    dpkg -i hinemos-6.2-agent-6.2.2-1.ubuntu.noarch.deb \
 && rm -f hinemos-6.2-agent-6.2.2-1.ubuntu.noarch.deb

RUN mkdir /var/lock/subsys

CMD service hinemos_agent start \
 && tail -f /dev/null
