FROM quay.io/autodeskcloud/mesos-base

RUN apt-get install -y unzip
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo deb https://apt.dockerproject.org/repo debian-jessie main >> /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-engine

EXPOSE 5051
CMD ["mesos-slave"]
