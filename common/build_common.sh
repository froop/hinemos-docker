#!/bin/bash -eu

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS}

FROM_TAG=hinemos-base:openjdk${JAVA_VER}-${OS}
SRC_DIR=${SERVICE}/base
DST_TAG=hinemos-${SERVICE}-base:${JRE_TAG}
echo ================================================================================
echo ${SRC_DIR} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${SRC_DIR} \
	--build-arg FROM=${FROM_TAG}

FROM_TAG=${DST_TAG}
SRC_DIR=${SERVICE}/${HINEMOS_MAJOR}/base
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}:${JRE_TAG}
echo ================================================================================
echo ${SRC_DIR} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${SRC_DIR} \
        --build-arg FROM=${FROM_TAG}

FROM_TAG=${DST_TAG}
SRC_DIR=${SERVICE}/common/package
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${JRE_TAG}
echo ================================================================================
echo ${SRC_DIR} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${SRC_DIR} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg MAJOR=${HINEMOS_MAJOR} \
	--build-arg MINOR=${HINEMOS_MINOR}

docker-compose build ${SERVICE}
