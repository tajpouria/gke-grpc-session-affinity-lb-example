gcloud container clusters create $CLUSTER_NAME \
  --zone $ZONE \
  --workload-pool=$GOOGLE_CLOUD_PROJECT.svc.id.goog

kubectl get nodes -o wide

kubectl create serviceaccount -n $KS_NAMESPACE $KSA_NAME

kubectl annotate serviceaccount --namespace=$KS_NAMESPACE \
  $KSA_NAME \
  iam.gke.io/gcp-service-account=$GOOGLE_CLOUD_PROJECT@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com

kubectl run -it \
  --image google/cloud-sdk:slim \
  --overrides "{ \"spec\": { \"serviceAccount\": \"$KSA_NAME\" } }" \
  --namespace $KS_NAMESPACE \
  workload-identity-test