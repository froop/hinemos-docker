#!/bin/bash -eu

. .env
SCRIPT_DIR=`dirname $0`

${SCRIPT_DIR}/build-os.sh
${SCRIPT_DIR}/build-java.sh
${SCRIPT_DIR}/build-hinemos.sh
