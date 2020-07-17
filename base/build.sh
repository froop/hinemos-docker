#!/bin/bash -eu

. .env

docker build -t ${OS} base/${OS}

docker build -t openjdk-${OS}:${JAVA_VER} base/openjdk-redhat --build-arg VERSION=${JAVA_VER} --build-arg OS=${OS}

docker build -t hinemos-base:openjdk${JAVA_VER}-${OS} base/hinemos-base --build-arg FROM=openjdk-${OS}:${JAVA_VER}
