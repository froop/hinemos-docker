#!/bin/bash -eu

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS}

FROM_TAG=hinemos-base:openjdk${JAVA_VER}-${OS}
CONTEXT=${SERVICE}/base
DST_TAG=hinemos-${SERVICE}-base:${JRE_TAG}
echo ================================================================================
echo ${CONTEXT} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG}

FROM_TAG=${DST_TAG}
CONTEXT=${SERVICE}/${HINEMOS_MAJOR}/base
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}:${JRE_TAG}
echo ================================================================================
echo ${CONTEXT} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${CONTEXT} \
        --build-arg FROM=${FROM_TAG}

FROM_TAG=${DST_TAG}
CONTEXT=${SERVICE}/common/package
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${JRE_TAG}
echo ================================================================================
echo ${CONTEXT} "->" ${DST_TAG}
echo ================================================================================
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg MAJOR=${HINEMOS_MAJOR} \
	--build-arg MINOR=${HINEMOS_MINOR} \
	--build-arg DISTRIBUTION=${DISTRIBUTION}

docker-compose build ${SERVICE}
