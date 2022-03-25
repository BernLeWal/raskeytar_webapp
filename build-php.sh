#!/bin/bash

# Prepare temporary directory
rm -rf tempdir
mkdir tempdir
mkdir tempdir/html

# Copy WebSite
cp -r static/* tempdir/html/.
cp -r app_php/* tempdir/html/.

# Generate Dockerfile
echo "FROM php:7.4-apache" > tempdir/Dockerfile
echo "WORKDIR /var/www/html/" >> tempdir/Dockerfile
echo "COPY ./html /var/www/html/" >> tempdir/Dockerfile

# Build Docker container
cd tempdir
docker build -t raskeytarapp-php .