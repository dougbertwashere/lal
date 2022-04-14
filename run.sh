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


echo "alias '..'='cd ..'" >> /root/.bash_aliases
echo "alias 'll'='ls -al'" >> /root/.bash_aliases
chown support:root .bash_aliases


cd /home/support
echo "alias '..'='cd ..'" >> .bash_aliases
echo "alias 'll'='ls -al'" >> .bash_aliases
chown support:root .bash_aliases

mkdir .ssh
chown support:root .ssh
chmod 700 .ssh
cd .ssh
ssh-keygen -N "" -b 1024 -t dsa -f /home/support/.ssh/id_dsa
chown support:root id_dsa id_dsa.pub

service dbus start
service ssh start


sleep infinity
