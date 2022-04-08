#!/bin/bash -eu

. .env

SERVICE=manager
JRE_TAG=${JAVA_IMAGE}-${OS_IMAGE}
MAJOR_DIR=${SERVICE}/${MANAGER_MAJOR}
MINOR_DIR=${MAJOR_DIR}/${MANAGER_MINOR}

FROM_TAG=${REPOSITORY}/hinemos-base-${JRE_TAG}
CONTEXT=${MINOR_DIR}/package
DOCKERFILE=${MAJOR_DIR}/common/DockerfilePackage
DST_TAG=hinemos-${SERVICE}-base-${JRE_TAG}:${MANAGER_MAJOR}.${MANAGER_MINOR}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "Dockerfile: ${DOCKERFILE}"
echo "================================================================================"
docker build -t ${DST_TAG} -f ${DOCKERFILE} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg MINOR_VER=${MANAGER_MINOR} \
	--add-host=docker-host:${LOCAL_IP}

# docker run -d -it --privileged --name hinemos-manager hinemos-manager-base-openjdk1.8.0-amzn1jp:4.1.4
# manager/login.sh
## cd /tmp/Hinemos_Manager-4.1.4_rhel6_64
## ./manager_installer_JP.sh
## rm -rf /tmp/Hinemos_Manager-4.1.4_rhel6_64
## sed -i 's/java version "1\.7\.0\.\*"/openjdk version "1.8.0.*"/' /opt/hinemos/bin/jvm_start.sh
## sed -i 's/MaxTenuringThreshold=32/MaxTenuringThreshold=15/' /opt/hinemos/bin/jvm_start.sh
## sed -i 's/1\.7\.0/1.8.0/' /opt/hinemos/etc/hinemos.cfg
## cp -p /opt/hinemos/sbin/service/hinemos_manager /etc/init.d/
## chkconfig --add hinemos_manager
## exit
# docker commit hinemos-manager frooprogrammer/hinemos-manager-package-openjdk1.8.0-amzn1jp:4.1.4
# docker rm -f hinemos-manager
