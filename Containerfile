#!/bin/bash
set -e

APP_NAME="lms-webserver"
IMAGE_NAME="lms-image"
PORT=8004

echo "--- 1. Building Image ---"
sudo podman build -t $IMAGE_NAME:latest -f Containerfile .


echo "--- 3. Starting New Container ---"
sudo podman run -d --name $APP_NAME -p $PORT:80 $IMAGE_NAME:latest

echo "--- 4. Verification ---"
sudo podman ps -a | grep $APP_NAME
