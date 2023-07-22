# syntax=docker.io/docker/dockerfile:1.4
FROM --platform=linux/riscv64 cartesi/python:3.10-slim-jammy

COPY requirements.txt /opt/cartesi/

RUN apt-get update
RUN apt-get -y install gcc
RUN apt-get -y install g++
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r /opt/cartesi/requirements.txt

WORKDIR /opt/cartesi/dapp
COPY . .
