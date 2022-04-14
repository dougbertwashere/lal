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

cd /home/lal

echo "alias '..'='cd ..'" >> .bash_aliases
echo "alias 'll'='ls -al'" >> .bash_aliases
chown lal:lal .bash_aliases

mkdir .ssh
chown lal:lal .ssh
chmod 700 .ssh
cd .ssh
ssh-keygen -b 1024 -t dsa -f /home/lal/.ssh/id_dsa
chown lal:lal id_dsa id_dsa.pub


sleep infinity
