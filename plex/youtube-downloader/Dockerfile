FROM python:latest

LABEL maintainer="Edmund Bennett"

ENV PYTHONUNBUFFERED=1
ENV PIP_ROOT_USER_ACTION=ignore

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    software-properties-common \
    wget \
    git \
    ffmpeg \
    cmake \
    gfortran \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel

RUN pip install --no-cache-dir yt-dlp

WORKDIR /app

ENTRYPOINT ["yt-dlp"]
