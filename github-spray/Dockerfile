#
# docker run \
#         --rm \
#         --name github-spray \
#         -ti \
#         -e "USERNAME=Eohyung Lee" \
#         -e "USEREMAIL=liquidnuker@gmail.com" \
#         -v $HOME/.netrc:/root/.netrc \
#         leoh0/github-spray \
#         -t $(date '+%x') \
#         --multiplier 10 \
#         --push \
#         --origin https://github.com/leoh0/d.git
#
FROM node:alpine

RUN apk add --no-cache git

RUN npm i -g github-spray

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
