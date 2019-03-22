FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS builder

RUN apt-get update \
  && apt-get install -y mono-complete \
  && rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR /sln

COPY ./SuperDuperMessages ./SuperDuperMessages
COPY ./SuperDuperMessages.sln ./
COPY ./build.sh ./build.cake ./
RUN bash ./build.sh

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT Production
ENTRYPOINT ["dotnet", "SuperDuperMessages.dll"]
COPY --from=builder ./sln/dist .
