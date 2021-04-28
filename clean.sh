#!/bin/bash -u

docker-compose down --rmi all --remove-orphans
manager/clean.sh
agent/clean.sh
web/clean.sh
#base/clean.sh
