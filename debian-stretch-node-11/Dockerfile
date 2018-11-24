FROM node:11-stretch

ENV DISPLAY=:99
ADD xvfb-chromium /usr/bin/xvfb-chromium

RUN set -ex \
&& useradd -m -u 1011 -s /bin/bash jenkins \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y \
python3-pip \
ninja-build \
libssl-dev \
libsqlite3-dev \
zlib1g-dev \
xvfb \
chromium \
libgtk-3-0 \
libgconf-2-4 \
groff-base \
&& pip3 install meson \
&& wget --quiet ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.27.tar.gz \
&& tar xfvz cyrus-sasl-2.1.27.tar.gz \
&& cd cyrus-sasl-2.1.27 \
&& ./configure --prefix=/usr \
&& make \
&& make install \
&& cd .. \
&& rm -rfv cyrus-sasl*
