#!/bin/bash
docker run -t -d -p 8080:8080 --name raskeytarapp1 raskeytarapp-python
echo Container named raskeytarapp1 started
echo Open http://127.0.0.1:8080/ in your browser.
echo Run "docker stop raskeytarapp1" to shutdown container.

