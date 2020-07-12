#!/bin/bash

OS=centos7jp
JAVA_VER=8
HINMEOS_MAJOR=6.2
HINEMOS_MINOR=2

JRE_TAG=openjdk${JAVA_VER}-${OS}
HINEMOS_VER=${HINMEOS_MAJOR}.${HINEMOS_MINOR}

docker-compose down --rmi all
docker rmi hinemos-manager-${HINEMOS_VER}:${JRE_TAG}
docker rmi hinemos-agent-${HINEMOS_VER}:${JRE_TAG}
docker rmi hinemos-web-${HINEMOS_VER}:${JRE_TAG}
docker rmi hinemos-manager-base:${JRE_TAG}
docker rmi hinemos-agent-base:${JRE_TAG}
docker rmi hinemos-web-base:${JRE_TAG}
docker rmi openjdk-${OS}:${JAVA_VER}
docker rmi ${OS}
