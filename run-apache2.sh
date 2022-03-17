#!/bin/bash
docker rm raskeytarapp2 >/dev/null
docker run -t -d -p 8081:80 --name raskeytarapp2 raskeytarapp-apache2
echo Container named raskeytarapp2 started
echo .
echo Open http://127.0.0.1:8081/ in your browser.
echo .
echo Run "docker stop raskeytarapp2" to shutdown container.

