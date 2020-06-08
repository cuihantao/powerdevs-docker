#!/bin/bash
CONTAINERID=$( docker container ls -l  |  awk '{print $1}' | tail -n 1 )
docker exec -it $CONTAINERID  bash
