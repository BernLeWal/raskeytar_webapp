#!/bin/bash

# Prepare temporary directory
rm -rf tempdir
mkdir tempdir
mkdir tempdir/app

# Copy WebSite
cp package*.json tempdir/
cp raskeytar_app.js tempdir/
cp -r static/* tempdir/app/.

# Generate Dockerfile
echo "FROM node:16" > tempdir/Dockerfile
# Create app directory
echo "WORKDIR /usr/src/app"

# Install app dependencies"
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
echo "COPY package*.json ./" >> tempdir/Dockerfile

echo "RUN npm install" >> tempdir/Dockerfile
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
echo "COPY raskeytar_app.js ." >> tempdir/Dockerfile

echo "EXPOSE 8080" >> tempdir/Dockerfile

echo 'CMD [ "node", "raskeytar_app.js" ]' >> tempdir/Dockerfile

# Build Docker container
cd tempdir
docker build -t raskeytarapp-nodejs .
