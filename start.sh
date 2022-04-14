#!/bin/bash

# if there is an arg 1, then debug asked for


net=10-131-110

do_debug () {
for i in {3..3}
do
	n=$(( $i + 64 ))

	ip=$net-$n

	echo "docker run --name lal-$i -h lal-$ip -it --rm --cap-add CAP_NET_ADMIN dougbertwhy/lal /bin/bash"
	      docker run --name lal-$i -h lal-$ip -it --rm --cap-add CAP_NET_ADMIN dougbertwhy/lal /bin/bash

	echo
done
}

do_real () {
for i in {3..60}
do
	n=$(( $i + 64 ))

	ip=$net-$n

	echo "docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/lal"
	      docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/lal

	echo
done
}


if [ $# = 0 ]
then
	do_real
else
	do_debug
fi

