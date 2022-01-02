#!/bin/bash -u

. .env

docker rmi ${REPOSITORY}/hinemos-base-${JAVA_IMAGE}-${OS_IMAGE}
docker rmi ${REPOSITORY}/${JAVA_IMAGE}-${OS_IMAGE}:latest
docker rmi ${REPOSITORY}/${OS_IMAGE}
