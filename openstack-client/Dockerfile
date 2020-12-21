#
# docker run \
#   $(env | grep OS_ | sed 's/OS_/ -e OS_/g' | tr -d '\n') \
#   --rm \
#   leoh0/openstack-client \
#   "$@"
#

FROM alpine:latest

MAINTAINER Eohyung Lee <liquidnuker@gmail.com>

# Alpine-based installation
# #########################
RUN apk add --update \
  python3-dev \
  py3-pip \
  py3-setuptools \
  ca-certificates \
  gcc \
  libffi-dev \
  openssl-dev \
  musl-dev \
  linux-headers \
  && pip install --upgrade --no-cache-dir \
     pip \
     setuptools \
     python-cinderclient \
     python-glanceclient \
     python-keystoneclient \
     python-neutronclient \
     python-novaclient \
     python-openstackclient \
     python-designateclient \
  && apk del gcc musl-dev linux-headers libffi-dev \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/openstack"]
