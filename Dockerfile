FROM debian:stable-slim

RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y iproute2 less ansible dropbear iputils-ping vim procps

RUN adduser lal
RUN echo lal:lal | chpasswd

ADD run.sh /

CMD /run.sh
