FROM jokke/ubuntu-mate-x2go-desktop

USER root

# set correct environment variables
ENV USER=mythtv \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# add repositories
RUN add-apt-repository universe -y && \
    apt-add-repository ppa:mythbuntu/0.28 -y && \

    apt-get update -qq && \

# install mythtv-backend, database and ping util
    apt-get install -y --no-install-recommends mythtv-backend mythtv-database mythtv-theme-mythbuntu iputils-ping && \

# create/place required files/folders
    mkdir -p /home/mythtv/.mythtv /var/lib/mythtv /var/log/mythtv /var/run/mysqld /root/.mythtv \
        /mnt/movies /mnt/recordings && \

# set a password for user mythtv and add to required groups
    echo "mythtv:mythtv" | chpasswd && \
    usermod -s /bin/bash -d /home/mythtv -a -G users,mythtv,adm,sudo mythtv && \

# set permissions for files/folders
    chown -R mythtv:users /var/lib/mythtv /var/log/mythtv /mnt/recordings /mnt/movies && \

# change ssh port
    sed -i 's/Port 22/Port 6522/' /etc/ssh/sshd_config && \

# clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        /usr/share/man /usr/share/groff /usr/share/info \
        /usr/share/lintian /usr/share/linda /var/cache/man && \
    (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) && \
    (( find /usr/share/doc -empty|xargs rmdir || true ))

# expose ports (UPnP, MythTV backend + API)
EXPOSE 5000/udp 6543 6544

COPY ["config.xml", "/etc/mythtv/"]
COPY ["*.conf", "/etc/supervisor/conf.d/"]
