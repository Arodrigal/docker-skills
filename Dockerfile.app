FROM painless/tox
LABEL maintainer="arodrigal@gmail.com"

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ARG USERNAME
ARG PASSWORD
ARG MONGO_HOST
ARG MONGO_PORT
ARG MONGO_DB_NAME

RUN /bin/sh -c 'echo "Mongo $USERNAME ***"'
#ENV MONGO_URI=mongodb://mongo-intel:f5adD95sBa@mongodb:27017/intel-db
ENV MONGO_URI=mongodb://$USERNAME:$PASSWORD@MONGO_HOST:$MONGO_PORT/$MONGO_DB_NAME

WORKDIR /tmp/app

EXPOSE 8080

CMD ["/docker-entrypoint.sh"]