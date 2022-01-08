gcloud builds submit -t gcr.io/$GOOGLE_CLOUD_PROJECT/echo-grpc echo-grpc

sed s/GOOGLE_CLOUD_PROJECT/$GOOGLE_CLOUD_PROJECT/ \
  k8s/echo-deployment.yaml | kubectl apply -f -

kubectl apply -f k8s/echo-service.yaml
