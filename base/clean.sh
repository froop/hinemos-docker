#!/bin/bash

. .env

docker rmi openjdk-${OS}:${JAVA_VER}
docker rmi ${OS}
