#!/bin/bash
docker run -d -p 8181:80 --name jusan-docker-exec nginx:mainline
docker exec -it jusan-docker-exec /bin/bash
