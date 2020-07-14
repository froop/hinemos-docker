#!/bin/bash

cd $1
for patch in ./*.sh
do
	echo run $patch
	/bin/bash -c $patch
	status=$?
	if [ $status -ne 0 ]; then
		exit $status
	fi
done
