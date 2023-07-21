# syntax=docker.io/docker/dockerfile:1.4
FROM --platform=linux/riscv64 cartesi/python:3.10-slim-jammy

# These variables can be passed to add an extra Python index with
# prebuilt wheels for riscv64. See README.md for more information.
ARG PIP_EXTRA_INDEX_URL
ARG PIP_TRUSTED_HOST
ARG PIP_ONLY_BINARY

COPY requirements.txt /opt/cartesi/

RUN apt-get update
RUN apt-get -y install gcc
RUN apt-get -y install g++
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r /opt/cartesi/requirements.txt

WORKDIR /opt/cartesi/dapp
COPY . .
