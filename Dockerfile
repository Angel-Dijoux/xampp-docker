FROM php:8.2.4-apache
RUN apt update && apt upgrade -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
EXPOSE 8080
CMD [ "" ]