FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y install git g++ build-essential wget vim net-tools htop
RUN mkdir -p /server/resources
RUN mkdir -p /server/FXServer
COPY ./resources /server/resources
COPY ./run.sh  /server/run.sh
COPY ./server.example.cfg /server/server.cfg
COPY ./FXServer /server/FXServer

RUN chmod 755 /server/run.sh

EXPOSE 30120
ENTRYPOINT [ "/server/run.sh" ]