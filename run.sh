#!/bin/bash -x

myNet=10.131.110

n=$(ip -o a show dev eth0 | fgrep 172 | awk '{print $4}' | cut -d. -f 4 | cut -d/ -f 1)

(( n += 64 ))

ip=$myNet.$n
suffix=27
gw=$myNet.65

echo "IP for this instance $ip"

/sbin/ip a add dev eth0 $ip/${suffix}
/sbin/ip r del $(/sbin/ip route show default)
/sbin/ip r a default via $gw

/usr/sbin/dropbear

sleep infinity
