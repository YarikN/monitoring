helm del --purge grafana;
helm del --purge prometheus;
kubectl delete namespaces monitoring;
