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
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin
RUN mkdir /usr/local/android-sdk-linux && \
    cd /usr/local/android-sdk-linux && \
    wget -q ${ANDROID_SDK_URL} && \
    unzip ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME}
RUN apt-get install -y software-properties-common && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jdk && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean
# need to accept the lincences manually
ENV ANDROID_LICENSES ${ANDROID_HOME}/licenses
RUN mkdir ${ANDROID_LICENSES} && \
    echo "d56f5187479451eabf01fb78af6dfcb131a6481e" >> ${ANDROID_LICENSES}/android-sdk-license
RUN sdkmanager "platform-tools" "platforms;android-27"
RUN cd ~ && \
    git clone --recursive https://github.com/deltachat/deltachat-android-ii.git
# this would load the most current NDK Bundle. There have been problems with that in the past and we are using r14b currently (see the Readme.MD in android-ii)
# RUN sdkmanager "ndk-bundle"
ENV NDK_FILE android-ndk-r14b-linux-x86_64.zip
RUN cd /usr/local/android-sdk-linux && \
    wget https://dl.google.com/android/repository/${NDK_FILE} && \
    unzip ${NDK_FILE} && \
    rm ${NDK_FILE}
RUN ln -s /usr/local/android-sdk-linux/android-ndk-r14b ${ANDROID_HOME}/ndk-bundle
ENV PATH ${PATH}:${ANDROID_HOME}/ndk-bundle
RUN cd ~/deltachat-android-ii && \
    ndk-build
RUN cd ~/deltachat-android-ii && \
    ./gradlew
RUN cd ~/deltachat-android-ii && \
    ./gradlew build
RUN cd ~/deltachat-android-ii/build/outputs/apk/website/release/ && \
    ls *
#    ls Deltachat-website-release-unsigned*.apk
