REGION=us-central1
ZONE=$REGION-c

GOOGLE_CLOUD_PROJECT=$(gcloud config list --format 'value(core.project)')
CLUSTER_NAME=grpc-cluster-dc

KS_NAMESPACE=default
KSA_NAME=prometheus-to-sd-sa
