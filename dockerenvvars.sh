#!/usr/bin/env bash

# Get the IP address of the container named "java-server" and set it in the environment variable APP_IP
APP_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' java-server)

# Get the IP address of the container named "selenium-hub" and set it in the environment variable GRID_URL
GRID_URL=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' selenium-hub)

export APP_IP
export GRID_URL

echo "APP_IP=$APP_IP"
echo "GRID_URL=$GRID_URL"