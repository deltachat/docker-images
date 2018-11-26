# Official container from node.js based on Debian Stretch and node v11
FROM node:11-stretch

# HACK! to make this image work well on one of our slaves.
RUN useradd -m -u 1011 -s /bin/bash jenkins

# Update apt
RUN apt-get update && apt-get upgrade -y

# Install meson and ninja
RUN apt-get install -y python3-pip ninja-build
RUN pip3 install meson

# Install dependencies for deltachat-core
RUN apt-get install -y libssl-dev libsqlite3-dev zlib1g-dev

# Install cyrus-sasl
ENV SASL_VERSION 2.1.27
RUN curl -O ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${SASL_VERSION}.tar.gz
RUN tar zxf cyrus-sasl-${SASL_VERSION}.tar.gz
RUN cd cyrus-sasl-${SASL_VERSION} && \
    ./configure --disable-silent-rules \
                --disable-cmulocal \
                --disable-sample \
                --disable-obsolete_cram_attr \
                --disable-obsolete_digest_attr \
                --disable-staticdlopen \
                --disable-java \
                --disable-alwaystrue \
                --enable-checkapop \
                --enable-cram \
                --enable-digest \
                --enable-scram \
                --disable-otp \
                --disable-srp \
                --disable-srp-setpass \
                --disable-krb4 \
                --disable-gssapi \
                --disable-gss_mutexes \
                --disable-sia \
                --disable-auth-sasldb \
                --disable-httpform \
                --enable-plain \
                --enable-anon \
                --enable-login \
                --disable-ntlm \
                --disable-passdss \
                --disable-sql \
                --disable-ldapdb \
                --disable-macos-framework
RUN cd cyrus-sasl-${SASL_VERSION} && make
RUN cd cyrus-sasl-${SASL_VERSION} && make install
RUN ldconfig -v

# Install chromium et.al. for running electron integration tests
RUN apt-get install -y xvfb chromium libgtk-3-0 libgconf-2-4
