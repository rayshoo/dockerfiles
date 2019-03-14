FROM debian:stretch-slim
LABEL maintainer "Eohyung Lee <liquidnuker@gmail.com>"

RUN apt-get update && apt-get install -y \
	ca-certificates \
	dpkg \
	libcurl3 \
	libicu57 \
	libssl1.0.2 \
	liblttng-ust0 \
	libunwind8 \
	wget \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libsecret-1-dev \
    libsecret-1-0 \
    gir1.2-gnomekeyring-1.0 \
	libcanberra-gtk-module \
    libcurl3 \
    libgconf2-4 \
    libgcrypt20 \
    libnspr4 \
    libpulse0 \
    libpcre3 \
    libxkbfile1 \
    git \
    gconf2 \
    gconf-service \
	libasound2 \
    libgtk2.0-0 \
    libgtk-3-0 \
    libnotify4 \
    libxss1 \
    libxtst6 \
    libnss3 \
    python \
    gvfs-bin \
    xdg-utils \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    dbus-x11 \
    gnome-keyring \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN cd /usr/src \
	&& wget "https://github.com/Foundry376/Mailspring/releases/download/1.6.0/mailspring-1.6.0-amd64.deb" -O /tmp/mailspring.deb \
	&& dpkg -i /tmp/mailspring.deb

ENV HOME /home/mailspring
RUN useradd -u 1000 --create-home --home-dir $HOME mailspring \
    && mkdir -p /home/mailspring/.local/share/keyrings \
	&& chown -R mailspring:mailspring $HOME

WORKDIR $HOME

RUN dbus-uuidgen > /etc/machine-id

USER mailspring
ENTRYPOINT ["/usr/bin/mailspring", "--dev"]
