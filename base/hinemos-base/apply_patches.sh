#!/bin/bash -eu

cd $1
for patch in ./*.sh
do
	echo run $patch
	/bin/bash -c $patch
done
