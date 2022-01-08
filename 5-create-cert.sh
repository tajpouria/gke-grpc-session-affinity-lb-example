EXTERNAL_IP=$(kubectl get service envoy -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
  -keyout privkey.pem -out cert.pem -subj "/CN=$EXTERNAL_IP"

kubectl create secret tls envoy-certs \
  --key privkey.pem --cert cert.pem \
  --dry-run -o yaml | kubectl apply -f -
