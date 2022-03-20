#!/bin/bash
docker rm raskeytarapp4 >/dev/null
docker run -t -d -p 8083:8080 --name raskeytarapp4 raskeytarapp-nodejs
echo Container named raskeytarapp4 started
echo .
echo Open http://localhost:8083/ in your browser.
echo .
echo Run "docker stop raskeytarapp4" to shutdown container.

