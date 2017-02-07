FROM jokke/ubuntu-mate-x2go-desktop

# set correct environment variables
ENV USER=mythtv \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# add repositories
RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list && \
    apt-add-repository ppa:mythbuntu/0.28 -y && \

    apt-get update -qq && \

# install mythtv-backend, database and ping util
    apt-get install -y --no-install-recommends mythtv-backend mythtv-database iputils-ping && \

# create/place required files/folders
    mkdir -p /home/mythtv/.mythtv /var/lib/mythtv /var/log/mythtv /var/run/mysqld /root/.mythtv && \

# set a password for user mythtv and add to required groups
    echo "mythtv:mythtv" | chpasswd && \
    usermod -s /bin/bash -d /home/mythtv -a -G users,mythtv,adm,sudo mythtv && \
    userdel -r desktop && \

# set permissions for files/folders
    chown -R mythtv:users /var/lib/mythtv /var/log/mythtv && \

# clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        /usr/share/man /usr/share/groff /usr/share/info \
        /usr/share/lintian /usr/share/linda /var/cache/man && \
    (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) && \
    (( find /usr/share/doc -empty|xargs rmdir || true ))

# expose ports (UPnP, MythTV backend + API)
EXPOSE 5000/udp 6543 6544
