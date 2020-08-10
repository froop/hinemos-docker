FROM fluent/fluentd

RUN echo "" >> /fluentd/etc/fluent.conf \
	&& echo "<source>" >> /fluentd/etc/fluent.conf \
	&& echo "  @type http" >> /fluentd/etc/fluent.conf \
	&& echo "  @label @mainstream" >> /fluentd/etc/fluent.conf \
	&& echo "  port 8888" >> /fluentd/etc/fluent.conf \
	&& echo "</source>" >> /fluentd/etc/fluent.conf
