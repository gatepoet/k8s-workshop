docker run --detach ^
  --name k8s-workshop-api ^
  k8s-workshop-api:latest

docker run --detach ^
  --name k8s-workshop-web ^
  --link k8s-workshop-api ^
  --publish 28228:80 ^
  k8s-workshop-web:latest