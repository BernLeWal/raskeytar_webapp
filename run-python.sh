#!/bin/bash
docker rm raskeytarapp1 >/dev/null
docker run -t -d -p 8080:8080 --name raskeytarapp1 raskeytarapp-python
echo Container named raskeytarapp1 started
echo .
echo Open http://127.0.0.1:8080/ in your browser.
echo .
echo Run "docker stop raskeytarapp1" to shutdown container.

