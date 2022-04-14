# lal
Dockerfile for lunch and learn


On host:

with docker installed, then the docker0 bridge is installed as default

Host connects its NIC to a physical switch

add a 2nd NIC (on mobo, card or USB) for 2nd interface, connect to same physical switch

1) Add 2nd IF to the docker0 bridge

     `sudo brctl addif docker0  <interface ID>`
  
2) Add a subnet to the docker0 bridge

     `sudo ip a add <subnet> dev docker0`    #  ex subnet:  10.131.110.65/27
  
  
Then for docker image, build the image and launch the container
  
  
To generate the image 

`make` 

To run the image in a container with parameters, see the "start.sh" script

`docker run --name lal-$i -d -h lal-$ip --restart always --cap-add CAP_NET_ADMIN dougbertwhy/la`

