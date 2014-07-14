FROM ubuntu:14.04

MAINTAINER Bosse Klykken <bosse@met.no>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install alien cpio rpm2cpio wget libterm-size-perl libwww-perl perl-modules rpm git -yq

RUN git clone git://git.debian.org/git/collab-maint/rinse.git /rinse
WORKDIR /rinse
RUN make install

ADD config/slc-7.packages /etc/rinse/slc-7.packages
ADD config/rinse.conf /etc/rinse/rinse.conf
RUN mkdir -p /usr/lib/rinse/slc-7
ADD config/post-install.sh /usr/lib/rinse/slc-7/post-install.sh

RUN mkdir -p /vol/distro/temp
ADD config/start.sh /start.sh
VOLUME /vol/distro
CMD /bin/bash /start.sh

