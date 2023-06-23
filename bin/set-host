#!/bin/bash

source .env

HOSTS_FILE="/etc/hosts"
HOST="127.0.0.1  $PROJECT_NAME.$DOMAIN"

if [[ ! -f "$HOSTS_FILE" ]]; then
    echo "$HOSTS_FILE does not exist"
    exit 1
fi

if grep -qxF "$HOST" "$HOSTS_FILE"; then
    echo "$PROJECT_NAME.$DOMAIN already exists in $HOSTS_FILE"
else
    echo "$HOST" | sudo tee -a "$HOSTS_FILE"
    echo "$PROJECT_NAME.$DOMAIN appended to $HOSTS_FILE"
fi