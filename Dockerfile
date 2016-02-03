# DOCKER-VERSION 1.8.2
FROM       ubuntu:trusty
MAINTAINER Can Kutlu Kinay <me@ckk.im>

# install juicer
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 19E582D6 && \
    echo "deb http://ppa.launchpad.net/juicer-server/juicer/ubuntu precise main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends juicer

EXPOSE 9000
CMD ["juicer-server"]

