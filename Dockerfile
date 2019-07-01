FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS runtime

RUN apt-get -y update \
	&& apt-get -y install gcc automake autoconf libtool make wget \
    && apt-get install -y --allow-unauthenticated \
        libc6-dev \
        libgdiplus \
        libx11-dev

RUN wget http://www.leptonica.org/source/leptonica-1.72.tar.gz \
	&& tar xvzf leptonica-1.72.tar.gz \
	&& cd leptonica-1.72 \
	&& ./configure \
	&& make && make install

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app
EXPOSE 80
EXPOSE 443
