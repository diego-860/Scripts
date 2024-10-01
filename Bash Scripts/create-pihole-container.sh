#!/bin/bash

# Pull nginx alpine based image
podman pull docker.io/pihole/pihole:latest
# Create > run > name > map ports
podman run -d --name pihole -p 2569:80 pihole/pihole
# Set new password for Pihole
podman exec pihole pihole -a -p P@ssw0rd