ARG HINEMOS_TAG
FROM hinemos-manager:${HINEMOS_TAG}

COPY patch/* /tmp/patch/
WORKDIR /tmp/patch
RUN ./patch.sh

WORKDIR /root
