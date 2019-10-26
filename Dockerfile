FROM drupal:7.67-apache

COPY scripts/setup.sh setup.sh

RUN chmod +x setup.sh && \
    /bin/bash setup.sh && \
    rm setup.sh

COPY scripts/entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

CMD /bin/bash entrypoint.sh
