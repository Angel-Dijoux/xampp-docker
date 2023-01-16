FROM php:8.2.1-apache
FROM phpmyadmin:latest
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
EXPOSE 80
EXPOSE 8080