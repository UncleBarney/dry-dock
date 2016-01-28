## Marathon Dockerfile
FROM ubuntu:14.04
MAINTAINER Mesosphere <support@mesosphere.io>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get install -y \
    python-software-properties \
    software-properties-common

## DEPENDENCIES ##
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y mesos curl oracle-java8-installer oracle-java8-set-default

## MARATHON ##
ADD http://downloads.mesosphere.io/marathon/v0.14.0/marathon-0.14.0.tgz /tmp/marathon.tgz
RUN mkdir -p /opt/marathon && tar xzf /tmp/marathon.tgz -C /opt/marathon --strip=1 && rm -f /tmp/marathon.tgz

EXPOSE 8080
WORKDIR /opt/marathon
CMD ["--help"]
ENTRYPOINT ["/opt/marathon/bin/start"]
