FROM hinemos-manager:6.2.2

COPY patch/* /tmp/patch/
WORKDIR /tmp/patch
RUN ./patch.sh

WORKDIR /root
