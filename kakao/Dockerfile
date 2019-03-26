FROM ubuntu:18.04

ENV WINEDEBUG -all
ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# If you build winetricks package then you need to add zenity package
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
        && dpkg --add-architecture i386 \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
                wine32 \
                wine-stable \
                cabextract \
                locales \
                fontconfig \
                fonts-nanum* \
                msttcorefonts \
                zenity \
                wget \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
        && echo "en_US.UTF-8 UTF-8" >  /etc/locale.gen \
        && echo "ko_KR.UTF-8 UTF-8" >> /etc/locale.gen \
        && locale-gen

RUN useradd -u 1000 -d /home/wine -m -s /bin/bash wine
ENV HOME /home/wine
WORKDIR /home/wine
USER wine

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
