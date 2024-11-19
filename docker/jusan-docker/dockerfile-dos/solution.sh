#!/bin/bash
docker build -t nginx:jusan-dockerfile .
docker run -d -p 6060:80 --name jusan-dockerfile nginx:jusan-dockerfile
