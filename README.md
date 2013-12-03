docker-base
===========

Ubuntu 13.10 base image (Saucy Salamander), build on top of lgsd/saucy, where I used Debian’s tool [**Debootstrap**][1], for creating my own Docker Index base image: [**lgsd/saucy**][2].

Dockerfile
==========

# Ubuntu 13.10 BASE image (Saucy Salamander)
#
# VERSION       1.0

# use the ubuntu base image provided by Luca G. Soave (see https://index.docker.io/u/lgsd/)

FROM lgsd/saucy 
MAINTAINER Luca G. Soave, luca.soave@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu Saucy main universe" > /etc/apt/sources.list
RUN apt-get update


LICENSE
=======

The MIT License (MIT)

Copyright (c) 2013 Luca G. Soave

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[1]: https://wiki.debian.org/Debootstrap
[2]: https://index.docker.io/u/lgsd/saucy/
