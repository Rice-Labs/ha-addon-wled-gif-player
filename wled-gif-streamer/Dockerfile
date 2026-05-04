# Use the Home Assistant Debian-based base image (better for pre-compiled binaries)
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM $BUILD_FROM

# Install only the runtime system dependencies
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