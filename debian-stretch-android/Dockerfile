FROM debian:stretch

# Install system wide dependencies
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

# Install system wide dependencies
RUN apt-get install -y software-properties-common && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jdk && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean

# Add a build user
RUN groupadd --gid 1000 build \
&& useradd --uid 1000 --gid build --shell /bin/bash --create-home build

# Basic environment variables
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDROID_REPOSITORY https://dl.google.com/android/repository
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/ndk-bundle

# Let build user own android home
RUN mkdir ${ANDROID_HOME} && chown -R build:build ${ANDROID_HOME}

# Do everyting as build user from here on
USER build
WORKDIR /home/build

# Download and install Android SDK
ENV ANDROID_SDK_FILENAME sdk-tools-linux-4333796.zip
ENV ANDROID_SDK_URL ${ANDROID_REPOSITORY}/${ANDROID_SDK_FILENAME}
RUN cd ${ANDROID_HOME} && \
    wget -q ${ANDROID_SDK_URL} && \
    unzip ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME}

# Accept the licenses manually
ENV ANDROID_LICENSES ${ANDROID_HOME}/licenses
RUN mkdir ${ANDROID_LICENSES} && \
    echo "d56f5187479451eabf01fb78af6dfcb131a6481e" >> ${ANDROID_LICENSES}/android-sdk-license
RUN sdkmanager "platform-tools" "platforms;android-27"

# Install ndk-bundle
ENV NDK_FILE android-ndk-r14b-linux-x86_64.zip
RUN cd ${ANDROID_HOME} && \
    wget ${ANDROID_REPOSITORY}/${NDK_FILE} && \
    unzip ${NDK_FILE} && \
    rm ${NDK_FILE}
RUN ln -s ${ANDROID_HOME}/android-ndk-r14b ${ANDROID_HOME}/ndk-bundle
