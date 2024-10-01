#!/bin/bash

# Pull nginx alpine based image
podman pull docker.io/nginx:alpine
# Create > run > name > map ports
podman run -d --name nginx -p 8080:80 nginx:alpine
# Copy webpage contents
podman exec nginx mv /usr/share/nginx/html/podman-nginx/patriots-new.html /usr/share/nginx/html
podman exec nginx mv /usr/share/nginx/html/podman-nginx/about.html /usr/share/nginx/html
podman exec nginx mv /usr/share/nginx/html/podman-nginx/logo.jpg /usr/share/nginx/html  
podman exec nginx mv /usr/share/nginx/html/podman-nginx/old-logo.png /usr/share/nginx/html
podman exec nginx mv /usr/share/nginx/html/podman-nginx/patriots-stadium.html /usr/share/nginx/html
podman exec nginx mv /usr/share/nginx/html/podman-nginx/tree.png /usr/share/nginx/html 
