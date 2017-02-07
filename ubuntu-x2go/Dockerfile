FROM ubuntu:xenial

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \

# add x2go repository
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:x2go/stable && \

    apt-get update -y -qq && \

# install x2go
    apt-get install -y openssh-server pwgen \
        x2goserver x2goserver-xsession && \

# clean up
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \

# add user: desktop
    useradd -ms /bin/bash desktop && \
    echo "desktop:desktop" | chpasswd

RUN mkdir -p /var/run/dbus /var/run/sshd && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    sed -i "s/#PasswordAuthentication/PasswordAuthentication/g" /etc/ssh/sshd_config

COPY docker-entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/docker-entrypoint.sh"]
