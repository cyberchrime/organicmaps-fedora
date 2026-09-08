FROM docker.io/amd64/fedora:42

# Install build requirements
RUN dnf update -y && \
    sudo dnf install -y \
    jq \
    which \
    icu \
    curl \
    awk \
    wget \
    optipng \
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
    qt6-qtpositioning \
    qt6-qtpositioning-devel \
    qt6-qtsvg-devel \
    python3-pip \
    sqlite-devel \
    libXrandr-devel \
    libXinerama-devel \
    libXcursor-devel \
    libXi-devel \
    && curl -fsSL https://opencode.ai/install | bash \
    && dnf clean all \
    && pip install "protobuf~=3.20.0"


# Add entrypoint

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /root
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
