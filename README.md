# xamp-in-docker

Check this for install docker compose : https://docs.docker.com/compose/install/

**Create a file `docker-compose.yml` and copy/paste in this file, or download the file that suits you in my repo.**

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

## The image is not up to date for RPI

`sudo docker-compose up -d`

### Dockercompose for linux arm (raspberrypi...)

```
version: '3.3'
services:
    db:
        image: mysql:latest
        container_name: mysql
        restart: always
        environment:
            MYSQL_ROOT_PASSWORD: changeme
            MYSQL_USER: changeme
            MYSQL_PASSWORD: changeme
        ports:
            - 6004:3306
    web:
        image:  elki97413/pdo_mysql-php-apache:1.0.1
        container_name: pma-apache-php8
        depends_on:
            - db
        volumes:
            - ./php:/var/www/html
        restart: always
        environment:
             - PMA_HOST=db
             - PMA_ARBITRATY=1
        ports:
            - 80:80
```

`sudo docker-compose up -d`

Username for phpmyadmin : _`root`_

Password for phpmyadmin : _`changeme`_

**Note: Change your password in phpmyadmin if you use your server in public.**

**Note: `./php` is in your user path.**

_Image docker use for php-apache is `php:8-apache`_

My dockerHub profil: https://hub.docker.com/u/elki97413
