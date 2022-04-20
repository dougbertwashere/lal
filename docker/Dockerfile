FROM debian:latest

RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y iproute2 less ansible openssh-server iputils-ping vim procps sudo

RUN echo 'root:jerich0' | chpasswd

RUN useradd -rm -d /home/support -s /bin/bash -g root -G sudo -u 1000 support
RUN echo 'support:jerich0' | chpasswd
COPY .bash_aliases /home/support

RUN mkdir /home/support/.ssh
RUN chown support:root /home/support/.ssh
RUN chmod 700 /home/support/.ssh
COPY pubkey /home/support/.ssh/authorized_keys
RUN chown support:root /home/support/.ssh/authorized_keys

ADD run.sh /

CMD /run.sh
