FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
		apache2 \
		software-properties-common \
		supervisor \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/*

RUN LC_ALL=fr_CH.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y --no-install-recommends \
		libapache2-mod-php7.2 \
		php7.2 \
		php7.2-bcmath \
		php7.2-cli \
		php7.2-curl \
		php7.2-dev \
		php7.2-gd \
		php7.2-imap \
		php7.2-intl \
		php7.2-mbstring \
		php7.2-mysql \
		php7.2-pgsql \
		php7.2-pspell \
		php7.2-xml \
		php7.2-xmlrpc \
		php-apcu \
		php-memcached \
		php-pear \
		php-redis \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/*

RUN a2enmod php7.2
RUN a2enmod rewrite
ADD www /var/www/html
ADD apache-conf.conf /etc/apache2/sites-available/site.conf

RUN a2ensite site.conf
RUN a2dissite 000-default.conf

RUN apt-get update && apt-get install -y vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
