#!/bin/bash

# Gather the user's domain
read -p "Please enter the domain you'd like to use: " domain
# Gather the email for notifications
read -p "Please tner the email for urgent renewal and security notices: " email

# Install certbot and certbot for apache
sudo apt install certbot python3-certbot-apache -y
# Invoke certbot - use apache plugin - use variables
# Agree to ToS and run non-interactively
sudo certbot --apache -d $domain -m $email --agree-tos -n