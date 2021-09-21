FROM ubuntu:20.04

RUN true \
	&& apt update -y \
	&& DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
		build-essential \
		cmake \
		mysql-client \
		default-libmysqlclient-dev \
		default-mysql-client \
		pkg-config \
		libglib2.0-dev \
		zlib1g-dev \
		libpcre3-dev \
		libssl-dev \
	&& rm -rf /var/lib/apt/lists/*



COPY . /src/

WORKDIR /src/

RUN mkdir build && cd build && cmake .. && make install