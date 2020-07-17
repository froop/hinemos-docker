#!/bin/bash -eu

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS}

docker build -t hinemos-${SERVICE}-base:${JRE_TAG} \
	${SERVICE}/base \
	--build-arg FROM=hinemos-base:openjdk${JAVA_VER}-${OS}

docker build -t hinemos-${SERVICE}-base-${HINEMOS_MAJOR}:${JRE_TAG} \
	${SERVICE}/${HINEMOS_MAJOR}/base \
	--build-arg FROM=hinemos-${SERVICE}-base:${JRE_TAG}

docker build -t hinemos-${SERVICE}-base-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${JRE_TAG} \
	${SERVICE}/common/package \
	--build-arg FROM=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}:openjdk${JAVA_VER}-${OS} \
	--build-arg MAJOR=${HINEMOS_MAJOR} \
	--build-arg MINOR=${HINEMOS_MINOR}

docker-compose build ${SERVICE}
