FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --no-install-recommends -y \
  build-essential \
  clang \
  lld \
  cmake \
  ninja-build

# RUN apt-get install --no-install-recommends -y git python3 python3-pip