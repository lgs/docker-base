docker-base
===========

This is Ubuntu 13.10 image (Saucy Salamander), build on top of lgsd/saucy base ( [**FROM lgsd/saucy**][2] ). I used Debian’s tool [**Debootstrap**][1], for creating my own Docker Index Base Image lgsd/saucy.

Usage 
=====

From your host run the following:

	lsoave@basenode:~$ sudo docker run -i -t lgsd/docker-base /bin/bash
	[sudo] password for lsoave: 
	Unable to find image 'lgsd/docker-base' (tag: latest) locally
	Pulling repository lgsd/docker-base
	1e2df6fab51e: Download complete
	9d0f39195402: Download complete
	2de93db8c076: Download complete
	8d6208443591: Download complete
	61dec1560550: Download complete
	4a821504dd7f: Download complete
	root@e40a94ecedfa:/#

now you are in the new continer e40a94ecedfa as root (see new prompt: root@e40a94ecedfa:/#). 

You can also inspect from another terminal:

	lsoave@basenode:~$ docker ps
	CONTAINER ID        IMAGE                     COMMAND             CREATED             STATUS              PORTS               NAMES
	e40a94ecedfa        lgsd/docker-base:latest   /bin/bash           7 minutes ago       Up 7 minutes                            silver_frog         
	lsoave@basenode:~$ 

The image is TRUSTED, and it has been downloaded from official [**DOCKER index**][3]

	lsoave@basenode:~$ docker search lgsd/docker-base
	NAME               DESCRIPTION                                     STARS     OFFICIAL   TRUSTED
	lgsd/docker-base   This is Ubuntu 13.10 image (Saucy Salamand...   0                    [OK]
	lsoave@basenode:~$ 

	lsoave@basenode:~$ docker images
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	lgsd/docker-base    latest              1e2df6fab51e        About an hour ago   16.39 kB (virtual 297.6 MB)
	lsoave@basenode:~$ 

on your host machine you can se the new guest image, running into linux lxc continer process:

	lsoave@basenode:~$ ps -ef | grep docke[r]
	root      1254  1251  1 22:39 ?        00:00:19 /usr/bin/docker -d
	root      2619  2447  0 22:40 pts/2    00:00:00 sudo docker run -i -t lgsd/docker-base /bin/bash
	root      2660  2619  0 22:40 pts/2    00:00:00 docker run -i -t lgsd/docker-base /bin/bash
	root      2802  1254  0 22:44 pts/1    00:00:00 lxc-start -n e40a94ecedfa00be4f3a8621e2f3dd150b180e86bded7129bc1abba614b189c5 -f /var/lib/docker/containers/e40a94ecedfa00be4f3a8621e2f3dd150b180e86bded7129bc1abba614b189c5/config.lxc -- /.dockerinit -g 172.17.42.1 -- /bin/bash
	lsoave@basenode:~$ 

and as you can see, the continer is running Ubuntu 13.10 updated system :

	root@e40a94ecedfa:/# lsb_release -a
	No LSB modules are available.
	Distributor ID:	Ubuntu
	Description:	Ubuntu 13.10
	Release:	13.10
	Codename:	saucy
	root@e40a94ecedfa:/# 

	root@e40a94ecedfa:/# grep upgrade /var/log/dpkg.log
	2013-12-03 16:10:51 upgrade dpkg 1.16.12ubuntu1 1.16.12ubuntu1
	2013-12-03 16:10:57 upgrade base-files:amd64 6.12ubuntu4 6.12ubuntu4
	2013-12-03 16:10:58 upgrade base-passwd:amd64 3.5.26 3.5.26
	2013-12-03 16:11:02 upgrade debconf:all 1.5.50ubuntu1 1.5.50ubuntu1
	2013-12-03 16:11:04 upgrade dpkg:amd64 1.16.12ubuntu1 1.16.12ubuntu1
	2013-12-03 16:11:18 upgrade libc6:amd64 2.17-93ubuntu4 2.17-93ubuntu4
	2013-12-03 16:11:42 upgrade mawk:amd64 1.3.3-17ubuntu1 1.3.3-17ubuntu1
	2013-12-03 16:11:46 upgrade perl-base:amd64 5.14.2-21build1 5.14.2-21build1
	root@e40a94ecedfa:/# 

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
[3]: https://index.docker.io/u/lgsd/docker-base/
