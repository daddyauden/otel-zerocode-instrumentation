FROM bitnami/wordpress:latest

USER root

RUN install_packages gcc make autoconf php-dev

WORKDIR /opt/bitnami/wordpress

COPY composer.json ./

RUN composer install --ignore-platform-reqs

RUN pecl install opentelemetry protobuf

COPY otel.php.ini /opt/bitnami/php/etc/conf.d/

RUN echo "[opentelemetry]" >> /opt/bitnami/php/etc/php.ini
RUN echo "extension=opentelemetry.so" >> /opt/bitnami/php/etc/php.ini

ARG ENV
ARG OTEL_SERVICE_NAME
ARG OTEL_TRACES_EXPORTER
ARG OTEL_EXPORTER_OTLP_PROTOCOL
ARG OTEL_EXPORTER_OTLP_ENDPOINT

ENV OTEL_PHP_AUTOLOAD_ENABLED=true \
    OTEL_TRACES_EXPORTER=${OTEL_TRACES_EXPORTER:-"otlp"} \
    OTEL_EXPORTER_OTLP_PROTOCOL=${OTEL_EXPORTER_OTLP_PROTOCOL:-"http/protobuf"} \
    OTEL_EXPORTER_OTLP_ENDPOINT=${OTEL_EXPORTER_OTLP_ENDPOINT:-"http://localhost:4318"} \
    OTEL_SERVICE_NAME=${OTEL_SERVICE_NAME:-"wordpress"} \
    OTEL_RESOURCE_ATTRIBUTES=deployment.environment=${ENV:-"prod"}

USER 1001
