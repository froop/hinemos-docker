#!/bin/bash -u

. .env

docker rmi frooprogrammer/hinemos-base-openjdk${JAVA_VER}-${OS_IMAGE}
docker rmi frooprogrammer/openjdk-${OS_IMAGE}:${JAVA_VER}
docker rmi frooprogrammer/${OS_IMAGE}
