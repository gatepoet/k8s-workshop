docker build K8s.Workshop.Api ^
  -t k8s-workshop-api ^
  -t localhost:5000/k8s-workshop-api
  
docker build . -f K8s.Workshop.Web/Dockerfile ^
  -t k8s-workshop-web ^
  -t localhost:5000/k8s-workshop-web