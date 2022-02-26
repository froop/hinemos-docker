FROM fluent/fluentd

RUN { \
    echo ""; \
    echo "<source>"; \
    echo "  @type http"; \
    echo "  @label @mainstream"; \
    echo "  port 8888"; \
    echo "</source>"; \
  } >> /fluentd/etc/fluent.conf
