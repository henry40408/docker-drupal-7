FROM drupal:7.67-apache

COPY scripts/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh && \
    /bin/bash /tmp/setup.sh && \
    rm /tmp/setup.sh

COPY scripts/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

CMD /bin/bash /tmp/entrypoint.sh
