FROM debian:stretch

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y \
python3-pip \
wget \
ninja-build \
libssl-dev \
libsasl2-dev \
libsqlite3-dev \
zlib1g-dev \
git \
unzip \
&& pip3 install meson

ENV ANDROID_SDK_FILENAME sdk-tools-linux-4333796.zip
ENV ANDROID_SDK_URL https://dl.google.com/android/repository/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-27
ENV ANDROID_BUILD_TOOLS_VERSION 27.0.3
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN mkdir /usr/local/android-sdk-linux && \
    cd /usr/local/android-sdk-linux && \
    wget -q ${ANDROID_SDK_URL} && \
    unzip ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME}

