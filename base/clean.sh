#!/bin/bash -u

. .env

docker rmi frooprogrammer/hinemos-base-${JAVA_IMAGE}${JAVA_VER}-${OS_IMAGE}
docker rmi frooprogrammer/${JAVA_IMAGE}-${OS_IMAGE}:${JAVA_VER}
docker rmi frooprogrammer/${OS_IMAGE}
