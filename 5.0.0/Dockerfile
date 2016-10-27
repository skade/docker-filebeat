FROM debian:jessie

ENV FILEBEAT_VERSION 5.0.0
ENV FILEBEAT_SHA1 33f55b0d282e11f2df78a00ffee1deaab9d2f24a

ADD https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz /tmp/filebeat.tar.gz

RUN echo "${FILEBEAT_SHA1}  /tmp/filebeat.tar.gz" > /tmp/filebeat.sha1 && \
    sha1sum -c /tmp/filebeat.sha1 && \
    mkdir -p /usr/src/filebeat && \
    mkdir -p /etc/filebeat && \
    tar zxvf /tmp/filebeat.tar.gz -C /usr/src/filebeat && \
    cp /usr/src/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64/filebeat /bin && \
    cp /usr/src/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64/filebeat.yml /etc/filebeat && \
    rm -rf /tmp/filebeat.tar.gz /tmp/filebeat.sha1

ENTRYPOINT ["/bin/filebeat", "-e", "-v", "-c", "/etc/filebeat/filebeat.yml"]
