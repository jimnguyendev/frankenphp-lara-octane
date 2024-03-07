ARG PHP_VERSION=8.3

FROM dunglas/frankenphp

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	git \
	unzip \
	librabbitmq-dev \
	libpq-dev

# add additional extensions here:
RUN install-php-extensions \
	@composer \
	apcu \
	pdo_mysql \
	gd \
	intl \
	imap \
	bcmath \
	redis \
	exif \
	mysqli \
	pcntl \
	zip \
	opcache

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --link docker/conf.d/app.ini $PHP_INI_DIR/conf.d/
COPY --link --chmod=755 docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint

WORKDIR /app/public

COPY . .

RUN rm -rf ./storage/logs/laravel*
RUN chmod -R 777 storage

ENTRYPOINT ["docker-entrypoint"]