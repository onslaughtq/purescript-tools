FROM debian:bookworm-slim@sha256:f4a83aa865a2b4a064ff142aa91c713180df9fcb86ce676b5de2981029379c37

ENV LANG="C.UTF-8" LANGUAGE="C.UTF-8" LC_ALL="C.UTF-8"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y -qq --no-install-recommends \
      ca-certificates curl lsb-release gnupg apt-transport-https git openssh-client && \
    apt-get clean

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

ARG NODE_MAJOR=20
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && \
    apt-get install -qq -y --no-install-recommends nodejs && \
    apt-get clean

RUN mkdir -p ~/.ssh/ && ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts

RUN npm install -g npm@10.2.3
RUN npm install -g spago@next purescript@0.15.12 purescript-psa@0.8.2 grunt-cli@1.4.3 esbuild@0.19.5
