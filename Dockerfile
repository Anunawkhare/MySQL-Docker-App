# Production MySQL with custom config
FROM mysql:8.0

# Set timezone (UTC recommended)
ENV TZ=UTC

# Copy configs
COPY config/my.cnf /etc/mysql/conf.d/
COPY config/sql/*.sql /docker-entrypoint-initdb.d/
COPY docker/entrypoint/custom-entrypoint.sh /usr/local/bin/

# Copy healthcheck script
COPY scripts/healthcheck.sh /healthcheck.sh

# Permissions
RUN chmod +x /usr/local/bin/custom-entrypoint.sh \
    && chmod +x /healthcheck.sh

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD /healthcheck.sh

ENTRYPOINT ["custom-entrypoint.sh"]
CMD ["mysqld"]
