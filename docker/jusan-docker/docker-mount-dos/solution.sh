#!/bin/bash
docker run -d -p 9999:80 --name jusan-docker-mount -v ./jusan-docker-mount.conf:/etc/nginx/conf.d/jusan-docker-mount.conf -v ./jusan-docker-mount/:/var/www/example nginx:mainline
docker logs jusan-docker-mount

