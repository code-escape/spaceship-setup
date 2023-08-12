FROM debian:11

RUN apt update -y
RUN apt install sudo -y
RUN sudo apt install git -y

RUN mkdir -p ~/control-center
COPY . /root/control-center/
