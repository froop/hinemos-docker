#!/bin/bash -eu

echo Extracting files with gunzip.
gunzip hinemos-images.tar.gz

echo
echo Loading images.
docker load < hinemos-images.tar

rm -f hinemos-images.tar
