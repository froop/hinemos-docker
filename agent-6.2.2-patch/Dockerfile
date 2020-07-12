ARG JRE_TAG
FROM hinemos-agent:6.2.2-${JRE_TAG}

COPY patch/* /tmp/patch/
WORKDIR /tmp/patch
RUN ./patch.sh

WORKDIR /root
