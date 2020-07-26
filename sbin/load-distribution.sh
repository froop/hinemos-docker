#!/bin/bash -eu

gunzip distribution.tar.gz
docker load < distribution.tar
rm -f distribution.tar
