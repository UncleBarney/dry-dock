# Base image for zipkin
# Date June 1st, 2015
FROM ubuntu:14.04
MAINTAINER Hechen Gao "zerelghc@gmail.com"

RUN apt-get update && apt-get install -y \
    scala \
    git \
    curl \
    openjdk-7-jdk
RUN git clone https://github.com/twitter/zipkin.git
RUN (cd zipkin; bin/sbt compile)
