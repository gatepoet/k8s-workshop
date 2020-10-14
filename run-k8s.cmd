helm install k8s-workshop-api charts\k8s-workshop-api --wait
helm test k8s-workshop-api

helm install k8s-workshop-web charts\k8s-workshop-web --wait
helm test k8s-workshop-web