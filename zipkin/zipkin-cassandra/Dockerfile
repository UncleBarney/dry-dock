# Based on documentation from DataStax
# http://docs.datastax.com/en/cassandra/2.0/cassandra/install/installDeb_t.html
FROM ubuntu:14.04
MAINTAINER Hechen Gao "zerelghc@gmail.com"

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    openjdk-7-jdk

ENV CASSANDRA_VERSION 2.1.4

# Add the DataStax community repo to the /etc/apt/sources.list.d/cassandra.sources.list
RUN echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list

# Add the DataStax repo key to aptitude trusted keys
RUN curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -

# Install cassandra
RUN apt-get install -y \
    dsc21-$CASSANDRA_VERSION \
    cassandra21-$CASSANDRA_VERSION

RUN https://raw.github.com/twitter/zipkin/master/zipkin-cassandra/src/schema/cassandra-schema.txt && \
    cassandra-cli -host localhost -port 9160 -f cassandra-schema.txt
