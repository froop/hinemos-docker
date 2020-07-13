#!/bin/bash

SERVICE=$1

HINEMOS_VER=${HINEMOS_MAJOR}.${HINEMOS_MINOR}
JRE_TAG=openjdk${JAVA_VER}-${OS}

docker rmi hinemos-${SERVICE}-${HINEMOS_VER}:${HINEMOS_TAG}
docker rmi hinemos-${SERVICE}-${HINEMOS_VER}:${JRE_TAG}
docker rmi hinemos-${SERVICE}-base:${JRE_TAG}
