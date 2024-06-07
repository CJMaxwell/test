#!/bin/bash

# Update package lists
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Start and enable Apache service
sudo systemctl start apache2
sudo systemctl enable apache2

# Download the HTML template from tooplate.com
wget -O /tmp/template.zip "https://www.tooplate.com/zip-templates/2128_design.html"

# Unzip the template
sudo apt-get install -y unzip
unzip /tmp/template.zip -d /tmp/template

# Copy the unzipped files to the Apache web directory
sudo cp -r /tmp/template/* /var/www/html/

# Set the correct permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Restart Apache to apply changes
sudo systemctl restart apache2

echo "Apache installation and HTML deployment complete."
