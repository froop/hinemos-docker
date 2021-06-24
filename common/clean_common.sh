#!/bin/bash -u

SERVICE=$1
JRE_TAG=${JAVA_IMAGE}${JAVA_VER}-${OS_IMAGE}

docker rmi frooprogrammer/hinemos-${SERVICE}-package-${JRE_TAG}:${HINEMOS_MAJOR}.${HINEMOS_MINOR}
docker rmi hinemos-${SERVICE}-major-base-${JRE_TAG}:${HINEMOS_MAJOR}
docker rmi hinemos-${SERVICE}-base-${JRE_TAG}
