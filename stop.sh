#!/bin/bash

names=

for i in {3..62}
do

	names="$names lal-$i"

done

	echo "docker container kill $names"
	      docker container kill $names

	echo "docker container rm $names"
	      docker container rm $names
