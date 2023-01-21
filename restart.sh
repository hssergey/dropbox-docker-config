#!/bin/bash

cd /home/sergey/programs/dropbox_docker/
/usr/bin/docker-compose -f docker-compose.yml -f 1.yml down
/usr/bin/docker-compose -f docker-compose.yml -f 1.yml up -d
