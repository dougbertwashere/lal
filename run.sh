#!/bin/bash -x

n=$(ip -o a show dev eth0 | fgrep 172 | awk '{print $4}' | cut -d. -f 4 | cut -d/ -f 1)

(( n += 64 ))

ip=10.131.146.$n
suffix=27
gw=10.131.146.65

echo "IP for this instance $ip"

/sbin/ip a add dev eth0 $ip/$suffix
/sbin/ip r del $(/sbin/ip route show default)
/sbin/ip r a default via $gw

/usr/sbin/dropbear

sleep infinity
