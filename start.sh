#!/bin/bash

net=10-131-110

for i in {1..30}
do

	n=$(( 2 + $i + 64 ))

	ip=$net-$n

	#$echo "docker run --name lal-$i -h lal-$ip -it --rm --cap-add CAP_NET_ADMIN dougbertwhy/lal"
	#       docker run --name lal-$i -h lal-$ip --it --rm --cap-add CAP_NET_ADMIN dougbertwhy/lal


	echo "docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/lal"
	      docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/lal

	echo
done
