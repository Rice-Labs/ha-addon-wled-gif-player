ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.12-alpine3.19
FROM $BUILD_FROM

# Install system dependencies and build tools
RUN apk add --no-cache \
    ffmpeg \
    libgcc \
    libstdc++ \
    libjpeg-turbo \
    openblas \
    build-base \
    cmake \
    linux-headers

WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
# We use --prefer-binary to avoid compiling from scratch
RUN pip3 install --no-cache-dir --prefer-binary -r wled-source/requirements.txt

RUN chmod a+x run.sh

CMD [ "/app/run.sh" ]
