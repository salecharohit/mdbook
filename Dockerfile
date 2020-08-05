# Modified from https://github.com/peaceiris/docker-mdbook
FROM rust:slim-buster AS builder

ARG MDBOOK_VERSION
ENV MDBOOK_VERSION ${MDBOOK_VERSION:-0.4.1}
ENV ARC="x86_64-unknown-linux-musl"
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    musl-tools && \
    rustup target add "${ARC}" && \
    cargo install mdbook --version "${MDBOOK_VERSION}" --target "${ARC}"