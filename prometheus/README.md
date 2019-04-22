## Prerequisites

* Kubernetes cluster up and running
* Helm
* Kubectl

## Helm configuration
```
kubectl apply -f helm-rbac.yaml
helm init --service-account helm 
```

## Installation

### Prometheus

```
$ kubectl create namespace monitoring
$ helm install -f values.yaml stable/prometheus --name prometheus --namespace monitoring
$ helm install --name prometheus stable/prometheus
$ export POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")
$ kubectl --namespace default port-forward $POD_NAME 9090
```

### Grapahana
```
$helm install --name grafana stable/grafana
$export POD_NAME=$(kubectl get pods --namespace default -l "app=grafana,component=" -o jsonpath="{.items[0].metadata.name}")
$kubectl --namespace default port-forward $POD_NAME 3000
```

### Alerm manager
