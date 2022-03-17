#!/bin/bash

# Prepare temporary directory
rm -rf tempdir
mkdir tempdir
mkdir tempdir/htdocs

# Copy WebSite
cp -r static/* tempdir/htdocs/.

# Generate Dockerfile
echo "FROM ubuntu" > tempdir/Dockerfile
echo "RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y" >> tempdir/Dockerfile
echo "COPY ./htdocs /var/www/html/" >> tempdir/Dockerfile
echo "EXPOSE 80" >> tempdir/Dockerfile
echo 'CMD ["nginx", "-g", "daemon off;"]' >> tempdir/Dockerfile

# Build Docker container
cd tempdir
docker build -t raskeytarapp-nginx .
