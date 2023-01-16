# xamp-in-docker
### Do you need preinstalled docker-compose (for linux) : 

Run this command in your console:

```sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose && sudo chmod +x /usr/bin/docker-compose```

For to verify the installation :

```sudo docker-compose --version```


**Create a file ```docker-compose.yml``` and copy/paste in this file, or download the file that suits you in my repo.**

### Dockercompose for linux amd64: 
```
version: '3.3'
services: 
    web:
        image: elki97413/pdo_mysql-php-apache
        container_name: apache-php
        depends_on: 
            - db
        volumes: 
            - ./php:/var/www/html
        restart: always
        ports: 
            - 80:80
    db: 
        image: mysql:latest 
        container_name: server_mysql
        restart: always
        environment: 
            MYSQL_ROOT_PASSWORD: root
        ports: 
            - 6003:3306
    phpmyadmin:
        image: phpmyadmin
        container_name: phpmyadmin
        environment: 
            - PMA_ARBITRATY=1
        restart: always
        ports:
            - 8080:80
        volumes: 
            - /sessions
            - ~/docker/phpmyadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php
            - /custom/phpmyadmin/theme/:/www/themes/theme/

```

``` sudo docker-compose up -d ```

### Dockercompose for linux arm (raspberrypi...)
``` 
version: '3.3'
services: 
    web:
        image: elki97413/pdo_mysql-php-apache_raspberrypi
        container_name: apache-php
        depends_on: 
            - db
        volumes: 
            - ./php:/var/www/html
        restart: always
        ports: 
            - 80:80
    db: 
        image: hypriot/rpi-mysql:latest 
        container_name: server_mysql
        restart: always
        environment: 
            MYSQL_ROOT_PASSWORD: root
        ports: 
            - 6003:3306
    phpmyadmin:
        image: phpmyadmin
        container_name: phpmyadmin
        environment: 
            - PMA_ARBITRATY=1
        restart: always
        ports:
            - 8080:80
        volumes: 
            - /sessions
            - ~/docker/phpmyadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php
            - /custom/phpmyadmin/theme/:/www/themes/theme/
```

``` sudo docker-compose up -d ```

Username for phpmyadmin : *```root```*

Password for phpmyadmin : *```root```*

**Note: Change your password in phpmyadmin if you use your server in public.**

**Note: If ports is used on the machine changed them with a free port.**

**Note: ```./php``` is in your user path.**

*Image docker use for php-apache is ```php:8-apache```*

### This image are edit by this Dockerfile : 

``` 
FROM php:8-apache
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
EXPOSE 80
```


My dockerHub profil: https://hub.docker.com/u/elki97413
