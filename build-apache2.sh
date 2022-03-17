#!/bin/bash

# Prepare temporary directory
rm -rf tempdir
mkdir tempdir
mkdir tempdir/htdocs

# Copy WebSite
cp -r static/* tempdir/htdocs/.

# Generate Dockerfile
echo "FROM httpd:2.4" > tempdir/Dockerfile
echo "WORKDIR /usr/local/apache2/htdocs/" >> tempdir/Dockerfile
echo "COPY ./htdocs /usr/local/apache2/htdocs/" >> tempdir/Dockerfile

# Build Docker container
cd tempdir
docker build -t raskeytarapp-apache2 .