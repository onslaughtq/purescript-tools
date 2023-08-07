FROM ghcr.io/flipstone/haskell-tools:debian-unstable-ghc-9.4.5-2023-07-18-1d8bf61 AS builder

COPY install-spago.sh /tmp/install-spago.sh
RUN /tmp/install-spago.sh

FROM debian:bookworm-slim

ENV LANG="C.UTF-8" LANGUAGE="C.UTF-8" LC_ALL="C.UTF-8"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y -qq --no-install-recommends \
      ca-certificates curl lsb-release gnupg apt-transport-https git && \
    apt-get clean

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -qq -y --no-install-recommends nodejs && \
    apt-get clean

RUN npm install -g npm@9.8.1
RUN npm install -g purescript@0.15.10 purescript-psa@0.8.2 grunt@1.6.1 esbuild@0.18.17
COPY --from=builder /root/.local/bin/spago /usr/local/bin/spago
