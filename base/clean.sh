#!/bin/bash -u

. .env

docker rmi hinemos-base-openjdk${JAVA_VER}-${OS_IMAGE}
docker rmi openjdk-${OS_IMAGE}:${JAVA_VER}
docker rmi ${OS_IMAGE}
