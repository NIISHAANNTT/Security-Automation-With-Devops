#!/bin/bash

#running the node-exporter container: 

docker run -d \
  --name=node-exporter \
  -p 9000:9100 \
  --pid="host" \
  --restart always \
  -v "/:/host:ro,rslave" \
  prom/node-exporter:latest \
  --path.rootfs=/host \
  --collector.systemd \
  --collector.cpu \
  --collector.diskstats \
  --collector.meminfo


#running the prometheus container with volume  on default port 9090:

docker run -d \
  --name=prometheus \
  -p 9090:9090 \
  -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus



#running the grafana container on default port 3000 and showing the dashboard:

docker run -d \
  --name=grafana \
  --network host \
  -p 3000:3000 \
  --restart always \
  grafana/grafana:latest
