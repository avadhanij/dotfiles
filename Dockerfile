FROM ubuntu:24.04

LABEL version="0.1"
LABEL description="Container for all my local development work"

ARG DEBIAN_FRONTEND=noninteractive
RUN <<EOF bash
    mkdir /root/Downloads
    apt update
    apt install -y git wget vim build-essential python3 openjdk-17-jdk golang sudo
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
EOF

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH="${PATH}:/home/ubuntu/.local/bin"

RUN <<EOT bash
    mkdir -p .local/bin
    wget https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-arm64 -O .local/bin/bazel
    chmod +x .local/bin/bazel
EOT

CMD /bin/bash