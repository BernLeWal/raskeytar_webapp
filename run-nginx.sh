#!/bin/bash
docker rm raskeytarapp3 >/dev/null
docker run -t -d -p 8082:80 --name raskeytarapp3 raskeytarapp-nginx
echo Container named raskeytarapp3 started
echo .
echo Open http://127.0.0.1:8082/ in your browser.
echo .
echo Run "docker stop raskeytarapp3" to shutdown container.

