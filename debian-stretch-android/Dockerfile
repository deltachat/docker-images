FROM debian:stretch

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y \
python3-pip \
ninja-build \
libssl-dev \
libsasl2-dev \
libsqlite3-dev \
zlib1g-dev \
&& pip3 install meson
