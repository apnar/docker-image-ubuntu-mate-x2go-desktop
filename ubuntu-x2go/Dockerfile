FROM jokke/ubuntu-base

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \

# add x2go repository
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:x2go/stable && \

    apt-get update -y -qq && \

# install x2go
    apt-get install -y x2goserver x2goserver-xsession && \

# clean up
    apt-get autoclean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/dbus

COPY ["*.conf", "/etc/supervisor/conf.d/"]

EXPOSE 22

CMD ["/usr/bin/supervisord", "-n"]
