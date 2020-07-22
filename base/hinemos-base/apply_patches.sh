#!/bin/bash -eu

shopt -s nullglob
for patch in ./*.sh
do
	echo run $patch
	/bin/bash -c $patch
done
