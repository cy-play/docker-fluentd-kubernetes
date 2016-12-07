FROM fabric8/fluentd:0.14.8

MAINTAINER Mourad Maatoug <mourad.maatoug@cy-play.com>

ENTRYPOINT ["/start-fluentd"]

ENV ELASTICSEARCH_HOST es-logging.default.svc

RUN touch /var/lib/rpm/* && yum install -y gcc-c++ && yum clean all

ENV KUBER_META_PLUGIN_VERSION 0.26.2
ENV ES_PLUGIN_VERSION 1.9.0
ENV PROMETHEUS_PLUGIN_VERSION 0.2.1
ENV GROK_PARSER_PLUGIN_VERSION 2.1.0

RUN scl enable rh-ruby23 'gem install --no-document fluent-plugin-kubernetes_metadata_filter -v $KUBER_META_PLUGIN_VERSION' && \
    scl enable rh-ruby23 'gem install --no-document fluent-plugin-elasticsearch -v $ES_PLUGIN_VERSION' && \
		scl enable rh-ruby23 'gem install --no-document fluent-plugin-prometheus -v $PROMETHEUS_PLUGIN_VERSION' && \
		scl enable rh-ruby23 'gem install --no-document fluent-plugin-grok-parser -v $GROK_PARSER_PLUGIN_VERSION' && \
    scl enable rh-ruby23 'gem cleanup fluentd'

ADD start-fluentd /start-fluentd
RUN chmod +x /start-fluentd
