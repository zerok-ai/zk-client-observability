helm upgrade --install --values loki-distributed-overrides.yaml loki grafana/loki-distributed -n grafana-loki --create-namespace
