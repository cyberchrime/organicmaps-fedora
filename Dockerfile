ARG ARCH
ARG FEDORA_VERSION
FROM docker.io/${ARCH}/fedora:${FEDORA_VERSION}

ARG ARCH
ENV ARCH ${ARCH}

# Install build requirements
RUN dnf update -y && \
sudo dnf install -y \
    git \
    clang \
    cmake \
    ninja-build \
    freetype-devel \
    libicu-devel \
    libstdc++-devel \
    mesa-libGL-devel \
    libglvnd-devel \
    qt6-qtbase-devel \
    qt6-qtsvg-devel \
    sqlite-devel \
    && dnf clean all


# Add entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /root
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
