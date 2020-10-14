# k8s-workshop

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
  - Enable Kubernetes
- [Helm CLI](https://helm.sh/docs/intro/install/#from-chocolatey-windows)

## Create and run a website in Docker Desktop

### Create aspnet core website

Clone the repository at <https://github.com/gatepoet/k8s-workshop>

```shell
git clone https://github.com/gatepoet/k8s-workshop.git
cd k8s-workshop
```

Compile and run both projects

```shell
cd src/K8s.Workshop

{% include_relative src/K8s.Workshop/run-local.cmd %}

start http://localhost:28228/
```

Verify that the website can get data from the api by visiting the website at <http://localhost:28228/>

Stop the running servers with `Ctrl+C`

### Create Docker containers

Add a file named `Dockerfile` (no file-extension) to each of the two projects.

#### `K8s.Workshop.Api/Dockerfile`

```docker
{% include_relative src/K8s.Workshop/K8s.Workshop.Api/Dockerfile %}
```

#### `K8s.Workshop.Web/Dockerfile`

```docker
{% include_relative src/K8s.Workshop/K8s.Workshop.Web/Dockerfile %}
```

Build and tag containers

```shell
{% include_relative src/K8s.Workshop/build-docker.cmd %}
```

Run containers

```shell
{% include_relative src/K8s.Workshop/run-docker.cmd %}

start http://localhost:28228/
```

Run website with TLS

```shell
{% include_relative src/K8s.Workshop/run-docker-tls.cmd %}
```

### Create Helm charts

Start a local registry server

```shell
docker run -dp 5000:5000 --restart=always --name registry registry
```

Push docker images to local registry

```shell
docker push localhost:5000/k8s-workshop-api
docker push localhost:5000/k8s-workshop-web
```

Install charts

```shell
{% include_relative run-k8s.cmd %}

start http://localhost:28228/
```

Clean up

```shell
{% include_relative cleanup-k8s.cmd %}
```
