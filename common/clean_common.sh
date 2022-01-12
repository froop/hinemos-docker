#!/bin/bash -u

SERVICE=$1
JRE_TAG=${JAVA_IMAGE}-${OS_IMAGE}

docker rmi -f ${REPOSITORY}/hinemos-${SERVICE}-${JRE_TAG}:${HINEMOS_MAJOR}.${HINEMOS_MINOR}
docker rmi -f hinemos-${SERVICE}-major-base-${JRE_TAG}:${HINEMOS_MAJOR}
docker rmi -f hinemos-${SERVICE}-base-${JRE_TAG}
