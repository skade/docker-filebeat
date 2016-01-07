# Elastic Filebeat in Docker

This Docker image contains [Elastic Filebeat](https://www.elastic.co/products/beats/filebeat), a lightweight, open source shipper for log file data. As the next-generation Logstash Forwarder, Filebeat tails logs and quickly sends this information to Logstash for further parsing and enrichment or to Elasticsearch for centralized storage and analysis.

## Usage

The image is available on [Docker Hub](https://hub.docker.com/r/olinicola/filebeat) and can be pulled with:

```
docker pull olinicola/filebeat
```

The container can be executed with:

```
docker run -d olinicola/filebeat
```

This will simply run Filebeat using the default `filebeat.yml` configuration file that comes with the [Linux 64-bit distribution](https://www.elastic.co/thank-you?url=https://download.elastic.co/beats/filebeat/filebeat-1.0.1-x86_64.tar.gz).

## Configuration

The Filebeat container can be configured passing a custom `filebeat.yml` configuration file as a Docker volume:

```
docker run -d -v "/path/to/your/filebeat.yml:/etc/filebeat/filebeat.yml" olinicola/filebeat
```

Check the official [Filebeat guide](https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-configuration-details.html) for more detailed info regarding the `filebeat.yml` available options.

## Example

Suppose you have an [Nginx](http://nginx.org) container named `nginx` that defines `/var/log/nginx` folder as a Docker volume. The Filebeat container can be instructed to fetch the log files from that volume with:


```
docker run -d --volumes-from nginx -v "/path/to/your/filebeat.yml:/etc/filebeat/filebeat.yml" olinicola/filebeat
```

The `filebeat.yml` configuration file can be something like this:

```json
filebeat:
    prospectors:
        -
            paths:
                - "/var/log/nginx/access.log"
            document_type: nginx-access
        -
            paths:
                - "/var/log/nginx/error.log"
            document_type: nginx-error
    output:
        logstash:
            enabled: true
            hosts: ["your-logstash-host:5000"]
            index: logstash
```
