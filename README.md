# Fluentd Log Collector For Kubernetes

This Docker image is based on the work of Fabric8 [fluentd](https://github.com/fabric8io/docker-fluentd-kubernetes/) image.

[![license](https://img.shields.io/github/license/cy-play/docker-fluentd-kubernetes.svg?maxAge=2592000)]()

Fluentd version : 0.14.8

## Installed Plugins
| Plugin name   | Version       |Purpose       |
| ------------- |:-------------:|:------------|
| [fluent-plugin-kubernetes_metadata_filter](https://github.com/fabric8io/fluent-plugin-kubernetes_metadata_filter)      | 0.26.2        | Add Kubernetes metadata to the logs        |
| [fluent-plugin-elasticsearch](https://github.com/uken/fluent-plugin-elasticsearch)      | 1.9.0         | Fluentd ES exporter |
| [fluent-plugin-prometheus](https://github.com/kazegusuri/fluent-plugin-prometheus)      | 0.2.1         | Prometheus metrics exposer |
| [fluent-plugin-grok-parser](https://github.com/fluent/fluent-plugin-grok-parser)      | 2.1.0         | Enable Grok parsing logic  |

## Purpose
This image captures logs from Docker containers,
enriches with Kubernetes metadata & pushes to the
specified Elasticsearch service deployed in your
Kubernetes environment.

You can configure behaviour via the following environment
variables:

* `ELASTICSEARCH_HOST` - the Elasticsearh host name to send data to
(default: `es-logging.default.svc`)
* `ELASTICSEARCH_PORT` - the Elasticsearh port to send data to
(default: `9200`)
* `ELASTICSEARCH_SCHEME` - `http` or `https` (default: `http`)
* `ELASTICSEARCH_USER` - user to connect with
* `ELASTICSEARCH_PASSWORD` - password to connect with
* `ELASTICSEARCH_DYNAMIC` - whether elasticsearch plugin configuration is
dymamic, e.g. to select index name prefix based on the namespace field
(default: `false`)
* `FLUENTD_FLUSH_INTERVAL` - how often to flush fluentd data
(default: `10s`)
* `FLUENTD_FLUSH_THREADS` - number of threads to use to flush
logs (default: `1`)
* `FLUENTD_RETRY_LIMIT` - number of retries on flush failures
(default: `10`)
* `FLUENTD_DISABLE_RETRY_LIMIT` - disable retry limit (default: `true`)
* `FLUENTD_RETRY_WAIT` - time to wait between retries (default:
`1s`)
* `FLUENTD_MAX_RETRY_WAIT` - maximum time to wait between retries (default:
`60s`)
* `FLUENTD_BUFFER_CHUNK_LIMIT` - max buffer chunk size (default:
`8m`)
* `FLUENTD_BUFFER_QUEUE_LIMIT` - max buffer queue size (default:
`8192`)
* `FLUENTD_BUFFER_TYPE` - buffer type: `memory` or `file`
(default: `memory`)
* `FLUENTD_BUFFER_PATH` - buffer file path if using a `file`
buffer (default: `/var/fluentd/buffer`)
* `FLUENTD_LOGSTASH_FORMAT` - use logstash format for index names (default `true`)
* `FLUENTD_LOGSTASH_PREFIX` - the prefix to use for index names in logstash
format (default `logstash`)
* `KUBERNETES_PRESERVE_JSON_LOG` - whether to preserve raw JSON logs in the
`log` field (default: `true`)
* `KUBERNETES_URL` - provide the URL of the Kubernetes master (default: `https://kubernetes.default.svc`)
* `KUBERNETES_VERIFY_SSL` - validate the Kubernetes SSL certificate (default: `true`)

For more information on Fluentd buffer plugins & options, see
http://docs.fluentd.org/articles/buffer-plugin-overview.
