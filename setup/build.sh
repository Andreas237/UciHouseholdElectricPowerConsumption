#!/bin/bash

NAME=$(cat DOCKER_IMAGE_NAME)
# add '--no-cache' option after build if requirements.txt has changed
docker build -t ${NAME} .
