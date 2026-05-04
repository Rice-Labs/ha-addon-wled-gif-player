# We change the base to 'debian-base' so the binary feels at home
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-debian:latest
FROM $BUILD_FROM

# We use 'apt-get' because we are now on a Debian-based image
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set up the app
WORKDIR /app
COPY wledvideo .
COPY run.sh .

# Ensure everything is executable
RUN chmod +x wledvideo run.sh

CMD [ "/app/run.sh" ]
