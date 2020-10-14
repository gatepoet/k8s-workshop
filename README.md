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
cd k8s-workshop
```

Compile and run both projects

```cmd
cd src/K8s.Workshop

:(src\K8s.Workshop\run-local.cmd)

start http://localhost:28228/
```

Verify that the website can get data from the api by visiting the website at <http://localhost:28228/>

Stop the running servers with `Ctrl+C`

### Create Docker containers

Add a file named `Dockerfile` (no file-extension) to each of the two projects.

#### `K8s.Workshop.Api/Dockerfile`

```dockerfile
:(src\K8s.Workshop\K8s.Workshop.Api\Dockerfile)
```

#### `K8s.Workshop.Web/Dockerfile`

```dockerfile
:(src\K8s.Workshop\K8s.Workshop.Web\Dockerfile)
```

Build and tag containers

```cmd
:(src\K8s.Workshop\build-docker.cmd)
```

Run containers

```cmd
:(src\K8s.Workshop\run-docker.cmd)

start http://localhost:28228/
```
