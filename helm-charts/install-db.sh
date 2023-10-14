#!/bin/bash
THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "checking helm binary"
if ! helm version; then
    echo "helm not available. ERR #4"
    exit 1
else
    echo "helm binary found."
fi

while [[ "$#" > "0" ]]
do
  case $1 in
    (*=*) eval $1;;
  esac
shift
done

helm dependency update $THIS_DIR
#helm upgrade zk-redis --install $THIS_DIR/ --create-namespace --namespace zk-client --wait
helm upgrade zk-promtail --install $THIS_DIR/ --namespace grafana-loki --create-namespace
#helm upgrade zk-promtail --install $THIS_DIR/ --set promtail.config.snippets.clusterId=cluster-12455 --namespace grafana-loki  --create-namespace