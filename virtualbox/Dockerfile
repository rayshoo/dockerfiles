# Run virtualbox in a container
#
# docker run -d \
# 	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	--privileged \
#	--name virtualbox \
#	jess/virtualbox
#
# On first run it will throw an error that you need to
# recompile the kernel module with: /etc/init.d/vboxdrv setup
#
# Here is how you get it to work:
# copy the files you need for the module from the container that
# is currently running to your host
#
# first the lib:
# 	docker cp virtualbox:/usr/lib/virtualbox /usr/lib
#
# then the share
# 	docker cp virtualbox:/usr/share/virtualbox /usr/share
#
# then run the script:
# 	/usr/lib/virtualbox/vboxdrv.sh setup
#
# it will recompile the module, you can then see it in lsmod
#
# then you can remove all the shit you copied
# 	rm -rf /usr/share/virtualbox /usr/lib/virtualbox
#
FROM debian:stretch-slim
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	libcurl3 \
	libvpx4 \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN buildDeps=' \
		ca-certificates \
		curl \
		gnupg \
	' \
	&& set -x \
	&& mkdir -p /etc/xdg/QtProject \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add - \
	&& echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" >> /etc/apt/sources.list.d/virtualbox.list \
	&& apt-get update && apt-get install -y \
	virtualbox-6.0 \
	--no-install-recommends \
	&& apt-get purge -y --auto-remove $buildDeps

# Add chrome user
RUN groupadd -g 1000 -r vbox && useradd -u 1000 -r -g vbox vbox \
    && mkdir -p '/home/vbox/VirtualBox VMs' && mkdir -p '/home/vbox/.config/VirtualBox' && chown -R vbox:vbox /home/vbox

USER vbox
WORKDIR /home/vbox

ENTRYPOINT	[ "/usr/bin/virtualbox" ]
