FROM alpine:latest
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

RUN apk --no-cache add \
	libvirt-client ebtables

ENTRYPOINT [ "virsh", "-c", "qemu:///system" ]
