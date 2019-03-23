FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS builder

WORKDIR /sln

COPY . .
RUN dotnet clean
RUN dotnet restore
RUN dotnet publish -c release -o /dist

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT Production
ENTRYPOINT ["dotnet", "SuperDuperMessages.dll"]
COPY --from=builder /dist .
