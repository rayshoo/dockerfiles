# Run pykickstart in a container
#
# docker run -it \
#     --rm \
#     -v "${PWD}:/tmp/" \
#     --workdir /tmp/  \
#     --name pykickstart \
#     docker.io/leoh0/pykickstart ksvalidator "$@"

FROM python:alpine

RUN pip install \
    six \
    requests \
    ordered-set \
    pyKickstart
