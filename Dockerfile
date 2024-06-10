ARG DEBIAN_VERSION="12.5"
FROM debian:${DEBIAN_VERSION}-slim

RUN \
  apt update && \
  apt install -y \
    git build-essential python3-pkgconfig \
    cmake \
    libssl-dev libplist-dev \
    libavahi-compat-libdnssd-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    && \
  git config --global advice.detachedHead false && \
  mkdir /src /build

WORKDIR /build
COPY scripts      scripts
COPY dependencies dependencies

VOLUME ["/build/out"]
ENTRYPOINT ["/build/scripts/build"]
