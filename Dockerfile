FROM ubuntu:23.04

ARG VERSION_RUST="nightly-2023-12-26"
ARG VERISON_MXPY="9.2.0"

RUN apt-get update && apt-get install -y \
    wget \
    libssl-dev \
    build-essential  \
    pkg-config \
    python3 \
    python3.11-venv \
    python3-pip

RUN useradd -m mx
WORKDIR /home/mx

USER mx

ENV PATH="/home/mx/multiversx-sdk:/home/mx/.cargo/bin:${PATH}"

RUN wget -O mxpy-up.py https://raw.githubusercontent.com/multiversx/mx-sdk-py-cli/main/mxpy-up.py &&  \
    python3 mxpy-up.py --not-interactive --verbose --exact-version ${VERISON_MXPY}

RUN mxpy config set dependencies.rust.tag ${VERSION_RUST} && mxpy deps install rust
