ARG ELASTICSEARCH_VERSION

FROM elasticsearch:${ELASTICSEARCH_VERSION}

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install \
  analysis-icu \
  analysis-phonetic