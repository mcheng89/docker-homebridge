FROM nodesource/jessie
MAINTAINER Michael <mcheng827@gmail.com>

##################################################
# Set environment variables                      #
##################################################

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

##################################################
# Install tools                                  #
##################################################

RUN apt-get update
RUN apt-get install -y libavahi-compat-libdnssd-dev

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge --unsafe-perm

# depending on your config.json you have to add your modules here!
RUN npm install -g homebridge-smartthings --unsafe-perm

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
