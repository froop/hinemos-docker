#!/bin/bash -eu

IMAGE_LIST=$(docker images --format '{{.Repository}}:{{.Tag}}')
echo Saving images to TAR file.
echo $IMAGE_LIST
docker save $IMAGE_LIST > hinemos-images.tar

echo
echo Compressing files with gzip.
gzip hinemos-images.tar
