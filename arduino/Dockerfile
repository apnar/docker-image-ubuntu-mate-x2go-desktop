FROM jokke/ubuntu-mate-x2go-desktop
MAINTAINER Joachim Wickman <joachim@wickman.in>
USER root

# accept license non-iteractive
Run echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# install Oracle Java 8 and some helper utilities
RUN apt-add-repository ppa:webupd8team/java -y && \
    apt-get update -qq && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default wget nano && \

# clean up
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# install Arduino IDE
ENV ARDUINO_IDE_VERSION 1.8.1
RUN (wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz \
	| tar xJC /opt \
	&& ln -s /opt/arduino-${ARDUINO_IDE_VERSION} /opt/arduino \
	&& ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino)

# create desktop user and launcher icon
RUN useradd -m desktop
COPY ["Aurdino.desktop", "/home/desktop/Desktop/"]
RUN chown -R desktop:desktop /home/desktop
