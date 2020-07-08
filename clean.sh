#!/bin/bash

docker-compose down --rmi all
docker rmi web-base
docker rmi manager-base
docker rmi openjdk-centos7:8
docker rmi centos7jp
