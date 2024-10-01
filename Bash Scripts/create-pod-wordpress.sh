#!/bin/bash

# Install podman
sudo apt install podman -y
# Create Wordpress pod > name pod > map ports
podman pod create --name wordpress-pod -p 8080:80
# Pull and create MariaDB container > configure db and db volume
podman run -d --pod wordpress-pod --name mariadb \
-v mariadb_data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=rootpassword \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wpuser \
-e MYSQL_PASSWORD=wppassword \
docker.io/library/mariadb:latest
# Pull and create MariaDB container > configure WP and volume
podman run -d --pod wordpress-pod --name wordpress \
-v wordpress_data:/var/www/html/wp-content/uploads \
-e WORDPRESS_DB_HOST=127.0.0.1:3306 \
-e WORDPRESS_DB_USER=wpuser \
-e WORDPRESS_DB_PASSWORD=wppassword \
-e WORDPRESS_DB_NAME=wordpress \
docker.io/library/wordpress:latest