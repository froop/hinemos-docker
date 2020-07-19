#!/bin/bash -eu

gunzip hinemos-images.tar.gz
docker load < hinemos-images.tar
