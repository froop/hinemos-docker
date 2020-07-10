#!/bin/bash

docker-compose down --rmi all
docker rmi hinemos-web-base
docker rmi hinemos-manager-base
docker rmi openjdk-centos7:8
docker rmi centos7jp
