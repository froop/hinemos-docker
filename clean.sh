#!/bin/bash

docker-compose down --rmi all
docker rmi hinemos-manager:6.2.2
docker rmi hinemos-agent:6.2.2
docker rmi hinemos-web:6.2.2
docker rmi hinemos-manager-base
docker rmi hinemos-agent-base
docker rmi hinemos-web-base
docker rmi openjdk-centos7:8
docker rmi centos7jp
