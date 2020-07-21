ARG FROM_TAG
FROM ${FROM_TAG}

COPY patch/* /tmp/patch/
RUN /tmp/apply_patches.sh /tmp/patch

WORKDIR /root
