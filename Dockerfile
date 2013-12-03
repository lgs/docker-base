# Ubuntu 13.10 BASE image (Saucy Salamander)
#
# VERSION       1.0

# use the ubuntu base image provided by Luca G. Soave (https://index.docker.io/u/lgsd/)

FROM lgsd/saucy 
MAINTAINER Luca G. Soave, luca.soave@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu/ saucy universe" > /etc/apt/sources.list
RUN apt-get update

