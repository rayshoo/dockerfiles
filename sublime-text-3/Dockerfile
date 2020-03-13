# DESCRIPTION:	Create sublime-text 3 container with its dependencies (https://www.sublimetext.com/3)
# AUTHORS:		Christian Koep <christiankoep@gmail.com>, Chuck Knox <charles.m.knox@gmail.com>
# USAGE:
#	# Build sublime-text 3 image
#	docker build -t sublime-text:3 .
#
#	# Run the container and mount the local settings and your code
#   # Your code must be under $HOME/Documents, you only need to change it here.
#		docker run -d -it \
#			-w $HOME/Documents \
#			-v $HOME/.config/sublime-text-3:$HOME/.config/sublime-text-3 \
#			-v $HOME/Documents:$HOME/Documents \
#			-v /tmp/.X11-unix:/tmp/.X11-unix \
#			-v $HOME/.local/share/recently-used.xbel:$HOME/.local/share/recently-used.xbel \
#			-e DISPLAY=$DISPLAY \
#			-e NEWUSER=$USER \
#			-e LANG=en_US.UTF-8 \
#			sublime-text:3
#
# POSSIBLE ISSUES:
#	# 'Gtk: cannot open display: :0'
#	Try to set 'DISPLAY=your_host_ip:0' or run 'xhost +' on your host.
#	(see: https://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0)
#

FROM debian:bullseye-slim
LABEL maintainer "Christian Koep <christiankoep@gmail.com>"

RUN apt-get update && apt-get -y install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	locales \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# Generate system-wide UTF-8 locale
# Sublime might nag about Ascii issue w/ Package Control otherwise
RUN echo "ko_KR.UTF-8 UTF-8" > /etc/locale.gen && \
	locale-gen && \
	echo "LANG=ko_KR.UTF-8" > /etc/locale.conf

# Add the sublime debian repo
RUN curl -sSL https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
RUN echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list

# Installing the libcanberra-gtk-module gets rid of a lot of annoying error messages.
RUN apt-get update && apt-get -y install \
	libcanberra-gtk-module \
	sublime-text \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
        && chown -R user:user $HOME

COPY start.sh /usr/local/bin/start.sh

WORKDIR $HOME

CMD [ "start.sh" ]
