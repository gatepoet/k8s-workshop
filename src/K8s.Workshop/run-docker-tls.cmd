docker run --detach ^
  --name k8s-workshop-api ^
  k8s-workshop-api:latest

docker run --detach ^
  --name k8s-workshop-web ^
  --link k8s-workshop-api ^
  --publish 28228:80 ^
  --publish 44378:443 ^
  --volume %USERPROFILE%/.aspnet/https:/https:ro ^
  --env ASPNETCORE_URLS=https://+:443;http://+:80 ^
  --env ASPNETCORE_HTTPS_PORT=44378 ^
  --env ASPNETCORE_Kestrel__Certificates__Default__Path=/https/aspnetapp.pfx ^
  --env ASPNETCORE_Kestrel__Certificates__Default__Password=Pass@word ^
  k8s-workshop-web:latest
