kubectl apply -f k8s/envoy-configmap.yaml

kubectl apply -f k8s/envoy-deployment.yaml

kubectl port-forward $(kubectl get pods -o name | grep envoy | head -n1) 8080:9901
