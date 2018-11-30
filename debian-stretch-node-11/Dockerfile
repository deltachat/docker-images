# Official container from node.js based on Debian Stretch and node v11
FROM node:11-stretch

# Update apt
RUN apt-get update && apt-get upgrade -y

# Install meson and ninja
RUN apt-get install -y python3-pip ninja-build
RUN pip3 install meson

# Install dependencies for deltachat-core
RUN apt-get install -y libssl-dev libsqlite3-dev zlib1g-dev libsasl2-dev

# Install chromium et.al. for running electron integration tests
RUN apt-get install -y xvfb chromium libgtk-3-0 libgconf-2-4