FROM ubuntu:14.04

# - update and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    wget

# - set environment variables
ENV REDIS_BASE_DIR /data

# - build redis stabl from source
# - install it into /usr/local/bin
RUN cd /tmp
RUN wget http://download.redis.io/releases/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
RUN cd redis-stable && make && make install && cp -f src/redis-sentinel /usr/local/bin
RUN mkdir -p /etc/redis
RUN rm -rf /tmp/redis-stable*

# - add config file
ADD resources/redis-server.conf /etc/redis/redis.conf

VOLUME [${REDIS_BASE_DIR}]
WORKDIR ${REDIS_BASE_DIR}
CMD ["redis-server", "/etc/redis/redis.conf"]
EXPOSE 6379
