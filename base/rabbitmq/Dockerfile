FROM ubuntu:14.04

# - update and install dependencies
RUN apt-get update && apt-get install -y wget

# - set environment variables
ENV RABBITMQ_BASE_DIR /data
ENV RABBITMQ_LOG_BASE ${RABBITMQ_BASE_DIR}/log
ENV RABBIGMQ_MNESIA_BASE ${RABBITMQ_BASE_DIR}/mnesia

# - Add exec script
ADD resources/script/rabbitmq-start /usr/local/bin/

# - installation of rabbitmq
RUN wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server
RUN rm -rf /var/lib/apt/lists/*
RUN rabbitmq-plugins enable rabbitmq_management
RUN echo "[{rabit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
RUN chmod +x /usr/local/bin/rabbitmq-start

VOLUME [${RABBIGMQ_LOG_BASE}, ${RABBITMQ_MNESIA_BASE}]
WORKDIR ${RABBITMQ_BASE_DIR}
CMD ["rabbitmq-start"]
EXPOSE 5672
EXPOSE 15672
