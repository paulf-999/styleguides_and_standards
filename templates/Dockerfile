# Base image
FROM ubuntu:20.04

# Set the working directory inside the container
WORKDIR /app

LABEL name="baseline_ubuntu_image"
LABEL desc="Baseline Ubuntu Docker image"
LABEL version="1.0"

ENV APT_GET_INSTALL_CMD="apt-get -yqq install --no-install-recommends"

# Install dependencies (if applicable)
RUN set -ex; \
    apt-get -yqq update; \
    $APT_GET_INSTALL_CMD build-essential=12.8ubuntu1.1; \
    $APT_GET_INSTALL_CMD git=1:2.25.1-1ubuntu3.11; \
    $APT_GET_INSTALL_CMD python3-pip=20.0.2-5ubuntu1.9; \
    $APT_GET_INSTALL_CMD wget=1.20.3-1ubuntu2; \
    $APT_GET_INSTALL_CMD less=551-1ubuntu0.1; \
    $APT_GET_INSTALL_CMD unzip=6.0-25ubuntu1.1; \
    $APT_GET_INSTALL_CMD vim=2:8.1.2269-1ubuntu5.15; \
    $APT_GET_INSTALL_CMD openjdk-11-jre; \
    apt-get autoremove -yqq --purge; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*
# the last command is used to clean up the apt cache & helps to keep the image size down

# Copy the project files into the container
COPY requirements.txt /app

# Make sure we are using latest pip & install any additional libs
RUN pip install --upgrade pip==23.1.2 --no-cache-dir \
    && pip install -r requirements.txt --no-cache-dir

# Expose any necessary ports
EXPOSE 80/tcp
