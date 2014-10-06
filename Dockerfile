FROM debian:wheezy
MAINTAINER bartojs

ENV SINOPIA_VERSION 0.12.0
ENV NODEJS_VERSION 0.10.32

RUN apt-get update && apt-get install -qy wget build-essential git python 
RUN wget -qO- http://nodejs.org/dist/v$NODEJS_VERSION/node-v$NODEJS_VERSION-linux-x64.tar.gz | tar xz -C /usr/local
RUN cp -R /usr/local/node-v$NODEJS_VERSION-linux-x64/* /usr/local/
RUN npm install -g sinopia@$SINOPIA_VERSION
RUN useradd sinopia && echo sinopia:sinopia | chpasswd
RUN mkdir -p /data /usr/local/etc/sinopia && chown -R sinopia /data /usr/local/etc/sinopia
COPY config.yaml /usr/local/etc/sinopia/

USER sinopia 
VOLUME /var/data
EXPOSE 4873
ENTRYPOINT ["sinopia", "--config", "/usr/local/etc/sinopia/config.yaml"]
