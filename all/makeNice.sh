kubectl create -f namespace-mon.json
helm repo update;
helm init;
sleep 2;
helm install --namespace monitoring --name prometheus stable/prometheus --set-file extraScrapeConfigs=extraScrapeConfigs.yaml;
sleep 2;
kubectl create -f prometheus-config.yaml
kubectl create -f prometheus-rules.yaml
helm install --namespace monitoring --name grafana stable/grafana --set adminUser=admin --set adminPassword=admin123 
kubectl get pods -n monitoring
export POD_NAME=$(kubectl get pods --namespace monitoring -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace monitoring port-forward $POD_NAME 3000