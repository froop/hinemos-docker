#!/bin/bash -eu

BRANCH=buildlinux
curl https://api.github.com/repos/froop/hinemos/commits/${BRANCH} 2>&1 | \
  grep '"date"' | tail -n 1 > $(dirname $0)/lastupdate.txt

docker build -t hinemos-manager-restored-6.2.2-openjdk1.8.0-centos7jp:${BRANCH} --build-arg BRANCH=${BRANCH} $(dirname $0)
