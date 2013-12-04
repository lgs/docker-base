docker-base
===========

Ubuntu 13.10 base image (Saucy Salamander), build on top of [**lgsd/saucy**][2], where I used Debian’s tool [**Debootstrap**][1], for creating my own Docker Index base image: [**lgsd/saucy**][2].

Dockerfile
==========

	# Dockerfile for Base Image Creation 
	# Ubuntu 13.10 (Saucy Salamander)
	# Built with Debian’s tool Debootstrap
	# See DOCKER index lgsd/saucy

	# VERSION    1.1

	# Apply Dockerfile Best Practices :
	#
	# 1. Keep common instructions at the top of the
	#    Dockerfile to utilize the cache.
	#
	# 2. Always pass -t to tag the resulting image.
	#
	# 3. Never map the public port in a Dockerfile.
	#
	# 4. Always use the array syntax when using CMD
	#    and ENTRYPOINT.
	#
	# 5. ENTRYPOINT and CMD are better together.
	#
	# see http://crosbymichael.com/dockerfile-best-practices.html

	FROM lgsd/saucy

	MAINTAINER Luca G. Soave <luca.soave@gmail.com>

	# You can force a daily or weekly upgrade of all your 
	# packages changing REFRESHED_AT date, from time to time 
	# otherwise the first lines would be cached by docker and  
	# you would always use non up-to-date versions of your OS

	ENV REFRESHED_AT 2013-12-03

	# make sure the package repository is up to date 
	# for different ubuntu versions, eventually
	RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
	RUN apt-get update
	RUN apt-get upgrade -y


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
