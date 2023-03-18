FROM php:8.2.4-apache

ENV PMA_HOST=db
ENV PMA_LANG=fr

ENV PHPMYADMIN_VERSION=5.2.1
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget unzip \
    && rm -rf /var/lib/apt/lists/* \
    && wget -O phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.zip \
    && unzip phpmyadmin.zip \
    && rm phpmyadmin.zip \
    && mv phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages /usr/share/phpmyadmin \
    && mkdir -p /var/lib/phpmyadmin/tmp \
    && chown -R www-data:www-data /var/lib/phpmyadmin

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY config.inc.php /usr/share/phpmyadmin/

RUN wget -O blueberry.zip https://files.phpmyadmin.net/themes/blueberry/1.1.0/blueberry-1.1.0.zip \
    && unzip blueberry.zip -d /usr/share/phpmyadmin/themes/ \
    && rm blueberry.zip

RUN echo "\$cfg['ThemeDefault'] = 'blueberry';" >> /usr/share/phpmyadmin/config.inc.php

EXPOSE 80

CMD ["apache2-foreground"]



