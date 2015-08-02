FROM ubuntu:10.04

MAINTAINER Ilias Kiourktsidis "ekiourk@gmail.com"

RUN apt-get update && apt-get install -y\
  build-essential\
  autoconf\
  automake\
  libxmu-dev\
  curl\
  gcc-4.3

RUN curl -L http://downloads.sourceforge.net/project/nsnam/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz | tar xz

RUN mv ns-allinone-2.35 ns2

WORKDIR ns2

ADD patch.diff /ns2/patch.diff

RUN patch -p1 < patch.diff

RUN ./install

ENV PATH $PATH:/ns2/bin:/ns2/tcl8.5.10/unix:/ns2/tk8.5.10/unix
ENV LD_LIBRARY_PATH /ns2/otcl-1.14:/ns2/lib
ENV TCL_LIBRARY /ns2/tcl8.5.10/library

WORKDIR ns-2.35
