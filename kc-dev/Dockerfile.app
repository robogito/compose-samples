# docker build -t robogito/robos-app:8.x.x . [harbor.io.xxx/intern/robos-app:8.x.x .]
# docker build -t robogito/php-nginx:8.x.x -f Dockerfile.app .
# docker push robogito/robos:8.x.x [harbor.io.xxx/intern/robos-app:8.x.x

FROM existenz/webstack:8.3

RUN apk -U --no-cache add \
    php83-bcmath \
    php83-ctype \
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-ftp \
    php83-gd \
    php83-intl \
    php83-iconv \
    php83-mbstring \
    php83-openssl \
    php83-pgsql \
    php83-pdo \
    php83-pdo_pgsql \
    php83-pdo_mysql \
    php83-pdo_sqlite \
    php83-pcntl \
    php83-phar \
    php83-posix \
    php83-session \
    php83-sodium \
    php83-sqlite3 \
    php83-simplexml \
    php83-tokenizer \
    php83-pecl-redis \
    php83-json \
    php83-xml \
    php83-xmlreader \
    php83-xmlwriter \
    php83-zip

# Production!
# COPY --chown=php:nginx ./phpapp /www/
# RUN find /www -type d -exec chmod -R 555 {} \; \
#     && find /www -type f -exec chmod -R 444 {} \; \
#     && find /www/storage /www/bootstrap/cache -type d -exec chmod -R 755 {} \; \
#     && find /www/storage /www/bootstrap/cache -type f -exec chmod -R 644 {} \;

WORKDIR /www
