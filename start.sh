#!/bin/bash

net=10-131-110

debug=0

#for i in {3..3}
for i in {3..60}
do
	n=$(( $i + 64 ))

	ip=$net-$n

	if [ $debug = 1 ]; then
		echo "docker run --name lal-$i -h lal-$ip -it --rm --cap-add CAP_NET_ADMIN dougbertwhy/lal /bin/bash"
		      docker run --name lal-$i -h lal-$ip -it --rm --cap-add CAP_NET_ADMIN dougbertwhy/lal /bin/bash
	else
		echo "docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/lal"
		      docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/lal
	fi

	echo
done
