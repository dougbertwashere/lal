FROM debian:latest

RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y iproute2 less ansible openssh-server iputils-ping vim procps sudo

RUN useradd -rm -d /home/support -s /bin/bash -g root -G sudo -u 1000 support
RUN echo 'support:jerich0' | chpasswd
COPY .bash_aliases /home/support

ADD run.sh /

CMD /run.sh
