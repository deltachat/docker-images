FROM node:11-stretch

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3-pip ninja-build libssl-dev libsasl2-dev libsqlite3-dev zlib1g-dev xvfb chromium libgtk-3-0 libgconf-2-4 && pip3 install meson

ENV DISPLAY=:99

ADD xvfb-chromium /usr/bin/xvfb-chromium