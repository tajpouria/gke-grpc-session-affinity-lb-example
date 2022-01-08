kubectl apply -f k8s/metrics-adapter-deployment.yaml

kubectl annotate serviceaccount --namespace custom-metrics \
  custom-metrics-stackdriver-adapter \
  iam.gke.io/gcp-service-account=$GOOGLE_CLOUD_PROJECT@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com
