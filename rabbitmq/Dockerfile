FROM stackbrew/ubuntu:14.04

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    rabbitmq-server \
    && apt-get clean

RUN rabbitmq-plugins enable rabbitmq_management

EXPOSE 5672
EXPOSE 15672

CMD rabbitmq-server
