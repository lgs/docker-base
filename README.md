docker-base
===========

Docker Lab Explo Experi Base


Short Description
=================

To build Ubuntu 13.10 BASE image (Saucy Salamander), I used Debian’s tool Debootstrap (see [**https://wiki.debian.org/Debootstrap). 


Base Image Creation Process
===========================

$ sudo debootstrap saucy saucy > /dev/null

$ sudo tar -C saucy -c . | sudo docker import - lgsd/saucy

$ sudo docker run lgsd/saucy cat /etc/lsb-release

DISTRIB_ID=Ubuntu

DISTRIB_RELEASE=13.10

DISTRIB_CODENAME=saucy

DISTRIB_DESCRIPTION="Ubuntu 13.10

$ docker push lgsd/saucy

[1]: https://wiki.debian.org/Debootstrap
