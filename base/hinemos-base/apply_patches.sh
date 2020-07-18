#!/bin/bash -eu

cd $1
shopt -s nullglob
for patch in ./*.sh
do
	echo run $patch
	/bin/bash -c $patch
done
