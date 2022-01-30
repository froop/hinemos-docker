#!/bin/bash -eu

. .env
SCRIPT_DIR=`dirname $0`

if [[ "$(docker images -q ${REPOSITORY}/hinemos-base-${JAVA_IMAGE}-${OS_IMAGE})" == "" ]]; then
	if [[ "$(docker images -q ${REPOSITORY}/${JAVA_IMAGE}-${OS_IMAGE})" == "" ]]; then
		if [[ "$(docker images -q ${REPOSITORY}/${OS_IMAGE})" == "" ]]; then
			${SCRIPT_DIR}/build-os.sh
		fi
		${SCRIPT_DIR}/build-java.sh
	fi
	${SCRIPT_DIR}/build-hinemos.sh
fi
