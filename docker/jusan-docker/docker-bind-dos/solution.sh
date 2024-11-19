#!/bin/bash
docker run -d -p 7777:80 --name jusan-docker-bind -v ./nginx.conf:/etc/nginx/nginx.conf nginx:mainline
