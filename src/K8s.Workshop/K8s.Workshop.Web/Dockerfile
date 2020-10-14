FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./K8s.Workshop.Api/*.csproj ./K8s.Workshop.Api/
COPY ./K8s.Workshop.Web/*.csproj ./K8s.Workshop.Web/
RUN dotnet restore K8s.Workshop.Web

# Copy everything else and build
COPY . ./
RUN dotnet publish K8s.Workshop.Web -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "K8s.Workshop.Web.dll"]