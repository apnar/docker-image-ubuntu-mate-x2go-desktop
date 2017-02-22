FROM logstash

MAINTAINER Joachim Wickman <joachim@wickman.in>

# install plugins
RUN logstash-plugin install logstash-codec-sflow && \
    logstash-plugin install logstash-filter-translate

# configure
COPY logstash.conf /config-dir/

CMD ["-f", "/config-dir/logstash.conf"]
