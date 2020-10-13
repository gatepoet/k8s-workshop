# k8s-workshop

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
  - Enable Kubernetes
- [Helm CLI](https://helm.sh/docs/intro/install/#from-chocolatey-windows)

## Create and run a website in Docker Desktop

### Create aspnet core website

Clone the repository at <https://github.com/gatepoet/k8s-workshop>

```cmd
git clone https://github.com/gatepoet/k8s-workshop.git
```

Compile and run both projects. Verify that the website can get data from the api by visiting the website at <https://localhost:44378>

```cmd
cd k8s-workshop/src/K8s.Workshop
dotnet restore
dotnet build
start "Api" /d K8s.Workshop.Api dotnet run
start "Web" /d K8s.Workshop.Web dotnet run
start https://localhost:44378
```
