helm upgrade --install --values promtail-overrides.yaml --set config.snippets.clusterId=cluster-124 promtail grafana/promtail --namespace grafana-loki  --create-namespace
