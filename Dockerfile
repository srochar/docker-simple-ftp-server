## -*- docker-image-name: "mauler/simple-ftp-server" -*-

FROM python:slim
MAINTAINER Paulo <proberto.macedo@gmail.com>

ENV FTP_ROOT /ftp-home
ENV FTP_USER ftp
ENV FTP_PASS ftp
ENV FTP_PORT 21
ENV FTP_PASSIVE_PORT_MIN 60000
ENV FTP_PASSIVE_PORT_MAX 60100

VOLUME /ftp-home

ADD image/root/ /

RUN pip install pyftpdlib && \
    mkdir -pv $FTP_ROOT

EXPOSE $FTP_PORT

ENTRYPOINT /bin/simple-ftp-server
