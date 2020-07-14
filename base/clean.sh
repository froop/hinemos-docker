#!/bin/bash

. .env

docker rmi hinemos-base:openjdk${JAVA_VER}-${OS}
docker rmi openjdk-${OS}:${JAVA_VER}
docker rmi ${OS}
