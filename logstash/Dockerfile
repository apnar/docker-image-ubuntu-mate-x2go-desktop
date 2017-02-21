FROM logstash

MAINTAINER Joachim Wickman <joachim@wickman.in>

# install plugins
RUN logstash-plugin install logstash-codec-sflow

# configure
COPY logstash.conf /config-dir/

CMD ["-f", "/config-dir/logstash.conf"]
