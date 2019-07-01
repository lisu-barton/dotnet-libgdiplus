FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS runtime

RUN yum -y update \
    && yum install -y --allow-unauthenticated \
        libc6-dev \
        libgdiplus \
        libx11-dev \
     && rm -rf /var/lib/apt/lists/*

WORKDIR /app
EXPOSE 80
EXPOSE 443
