helm uninstall k8s-workshop-web
helm uninstall k8s-workshop-api

docker stop registry
docker container rm registry