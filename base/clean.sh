#!/bin/bash -u

. .env

docker rmi ${REPOSITORY}/hinemos-base-${JAVA_IMAGE}${JAVA_VER}-${OS_IMAGE}
docker rmi ${REPOSITORY}/${JAVA_IMAGE}-${OS_IMAGE}:${JAVA_VER}
docker rmi ${REPOSITORY}/${OS_IMAGE}
