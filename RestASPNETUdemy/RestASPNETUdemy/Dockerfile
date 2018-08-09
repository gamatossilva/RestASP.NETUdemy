FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY RestASPNETUdemy/RestASPNETUdemy.csproj RestASPNETUdemy/
RUN dotnet restore RestASPNETUdemy/RestASPNETUdemy.csproj
COPY . .
WORKDIR /src/RestASPNETUdemy
RUN dotnet build RestASPNETUdemy.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish RestASPNETUdemy.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "RestASPNETUdemy.dll"]
