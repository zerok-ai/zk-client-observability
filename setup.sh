kubectl create namespace grafana-loki
kubectl create namespace grafana
./create-secret.sh
./install-grafana.sh
#./install-loki.sh
#./install-promtail.sh

