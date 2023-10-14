helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install grafana-v2 grafana/grafana --namespace grafana --create-namespace

PASSWORD=$(kubectl get secret --namespace grafana grafana-v2 -o jsonpath="{.data.admin-password}" | base64 --decode ; echo)
echo $PASSWORD

export POD_NAME=$(kubectl get pods --namespace grafana -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana-v1" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace grafana port-forward $POD_NAME 3000

