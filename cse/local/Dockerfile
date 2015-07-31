FROM ubuntu:14.04
MAINTAINER hechen gao <hechen.gao@autodesk.com>

# - switch to noninteractive mode of apt-get
ENV DEBIAN_FRONTEND noninteractive

# - tons of things
RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer

# - create folder for code
RUN mkdir /code
RUN mkdir /conf
WORKDIR /code
ADD target/ /code/
ADD logger.xml /conf/logger.xml
EXPOSE 9000
