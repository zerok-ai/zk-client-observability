helm upgrade --install --values promtail-overrides.yaml promtail grafana/promtail --namespace grafana-loki  --create-namespace
