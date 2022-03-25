#!/bin/bash
docker rm raskeytarapp5 >/dev/null
docker run -t -d -p 8084:80 --name raskeytarapp5 raskeytarapp-php
echo Container named raskeytarapp5 started
echo .
echo Open http://127.0.0.1:8084/ in your browser.
echo .
echo Run "docker stop raskeytarapp5" to shutdown container.

