if [[ $# -eq 0 ]] ; then
    echo 'usage: test <header>'
    exit 1
fi

EXTERNAL_IP=$(kubectl get service envoy -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

grpcurl \
  -H "x-session-hash: $1" \
  -d '{"content": "With a given header I will always hit the same Pod"}' \
  -proto echo-grpc/api/echo.proto \
  -insecure \
  -v $EXTERNAL_IP:443 api.Echo/Echo
