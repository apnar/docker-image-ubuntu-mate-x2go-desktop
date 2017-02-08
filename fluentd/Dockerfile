FROM fluent/fluentd:latest-onbuild
MAINTAINER Joachim Wickman <joachim@wickman.in>
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root
RUN apk --no-cache add sudo build-base ruby-dev && \

    sudo -u fluent gem install fluent-plugin-secure-forward \
        fluent-plugin-newsyslog fluent-plugin-elasticsearch \
        fluent-plugin-record-reformer fluent-plugin-parser \
        fluent-plugin-rewrite-tag-filter && \

#clean up
    rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev

EXPOSE 24224 5140

USER fluent
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
