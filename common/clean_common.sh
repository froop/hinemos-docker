#!/bin/bash -u

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS_IMAGE}

docker rmi hinemos-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${HINEMOS_TAG}
docker rmi hinemos-${SERVICE}-base-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${JRE_TAG}
docker rmi hinemos-${SERVICE}-base-${HINEMOS_MAJOR}:${JRE_TAG}
docker rmi hinemos-${SERVICE}-base:${JRE_TAG}
