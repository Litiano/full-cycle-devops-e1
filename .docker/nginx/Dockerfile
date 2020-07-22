FROM nginx:latest

RUN apt-get update && apt-get install wget -y

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN rm /etc/nginx/conf.d/default.conf
## a imagem do nginx possui um entrypoint que executa qualquer arquivo que esteja na pasta /docker-entrypoint.d
## então coloquei o comando do dockerize lá.
COPY entrypoint.sh /docker-entrypoint.d/dockerize.sh

#COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY nginx.conf /var/www/.docker/nginx/nginx.conf
