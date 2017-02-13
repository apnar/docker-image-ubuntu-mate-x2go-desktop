FROM jokke/openwrt-buildroot

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

COPY ["config", "/home/openwrt/openwrt/.config"]

RUN cd ~/openwrt && \
    sudo chown openwrt .config && \
    scripts/feeds install -a && \
    make defconfig && \

# Compile firmware
    make -j "$(getconf _NPROCESSORS_ONLN 2> /dev/null)" V=s 2>&1 | tee build.log | grep -i error

CMD ["/bin/bash"]
