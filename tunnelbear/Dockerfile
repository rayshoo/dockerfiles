# https://github.com/KingNoosh/docker-alpine-tunnelbear
#
# docker run -d \
#        -e TUNNELBEAR_USER \
#        -e TUNNELBEAR_PASS \
#        -v /dev/net/tun:/dev/net/tun
#        --net=host \
#        --cap-add NET_ADMIN \
#        --name tunnelbear \
#        leoh0/tunnelbear

FROM alpine:3.9
LABEL maintainer="liquidnuker@gmail.com"
COPY ./entrypoint.sh /

RUN apk add --update --no-cache openvpn unzip && \
    rm -rf /tmp/* /var/cache/apk/* && \
    mkdir /etc/openvpn/client && \
    wget https://s3.amazonaws.com/tunnelbear/linux/openvpn.zip && \
    unzip openvpn && \
    mv -v openvpn/* /etc/openvpn/client && \
    rm -rf openvpn && \
    cd /etc/openvpn/client && \
    for f in *.ovpn; do mv "$f" "${f// /_}"; done && \
    for i in *.ovpn; do echo "keepalive 10 30" >> $i; done && \
    for i in *.ovpn; do echo "auth-user-pass login.key" >> $i; done && \
    apk del unzip && \
    chmod +x /entrypoint.sh

WORKDIR /etc/openvpn/client
ENTRYPOINT ["/entrypoint.sh"]
CMD ["openvpn", "/etc/openvpn/client/TunnelBear_United_States.ovpn"]
