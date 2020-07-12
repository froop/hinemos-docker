ARG JRE_TAG
FROM hinemos-manager:6.2.2-${JRE_TAG}

COPY patch/* /tmp/patch/
WORKDIR /tmp/patch
RUN ./patch.sh

WORKDIR /root
