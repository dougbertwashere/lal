# lal
Dockerfile for lunch and learn


On host:

with docker installed, then the docker0 bridge is installed as default

Host connects its NIC to a physical switch
add a 2nd NIC (on mobo, card or USB) for 2nd interface, connect to same physical switch

1) Add 2nd IF to the docker0 bridge
     `brctl addif docker0  <interface ID>`
  
2) Add a subnet to the docker0 bridge
     ip a dev docker0  <subnet>    #  10.131.110.65/27
  
Then for docker image, built the image and launch the container
  
  
make 
docker run -it -rm --cap-add CAP_NETWORK 
