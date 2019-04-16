# Run Kakaotalk using wine
#
#	if [[ ! -d "${HOME}/.wine" ]]; then
#		mkdir -p "${HOME}/.wine"
#	fi
#
#	docker run -d \
#		-e "GTK_IM_MODULE=uim" \
#		-e "XMODIFIERS=@im=uim" \
#		-e "QT_IM_MODULE=uim" \
#		-e "DISPLAY=unix$DISPLAY" \
#		-v /etc/localtime:/etc/localtime:ro \
#		-v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v "$HOME/.wine:/home/wine/.wine" \
#		--link pulseaudio:pulseaudio \
#		-e PULSE_SERVER=pulseaudio \
#		--hostname kakao \
#		--name kakao \
#		leoh0/kakao

FROM alpine:3.9

RUN echo 'x86' > /etc/apk/arch && \
        apk --no-cache add \
        ca-certificates \
        wget \
        wine \
        zenity

RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
        chmod +x ./winetricks && \
		mv ./winetricks /usr/local/bin/

RUN mkdir -p /usr/share/fonts/NanumFont && \
        cd /usr/share/fonts/ && \
        wget http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_TTF_ALL.zip && \
        unzip NanumFont_TTF_ALL.zip -d NanumFont && \
        rm -f NanumFont_TTF_ALL.zip

ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

