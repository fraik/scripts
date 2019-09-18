#!/bin/bash

# WARNING this is a silly tool which wreaks havoc on your docker env :D

function log {
    printf "\n[INFO] %s\n" "$1"
}

for DING in container image; do 
    log "Purging $DING"
    docker "$DING" ls -aq | xargs docker $DING rm 
done

log "Purging volumes"
docker volume prune -f

log "Displaying the size of the whale"
docker system df
