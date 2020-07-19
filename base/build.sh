#!/bin/bash -eu

. .env

SRC_DIR=base/${OS}
DST_TAG=${OS}:latest
echo ================================================================================
echo ${SRC_DIR} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${SRC_DIR}

FROM_TAG=${DST_TAG}
SRC_DIR=base/openjdk-redhat
DST_TAG=openjdk-${OS}:${JAVA_VER}
echo ================================================================================
echo ${SRC_DIR} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${SRC_DIR} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg VERSION=${JAVA_VER}

FROM_TAG=${DST_TAG}
SRC_DIR=base/hinemos-base
DST_TAG=hinemos-base:openjdk${JAVA_VER}-${OS}
echo ================================================================================
echo ${SRC_DIR} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${SRC_DIR} \
	--build-arg FROM=${FROM_TAG}
