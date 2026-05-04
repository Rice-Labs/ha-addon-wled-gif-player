# Use the official Home Assistant base image
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM $BUILD_FROM

# Install system dependencies using Alpine's package manager (apk)
RUN apk add --no-cache \
    ffmpeg \
    libgcc \
    libstdc++ \
    glib \
    libjpeg-turbo

# Set up the app
WORKDIR /app
COPY wledvideo .
COPY run.sh .

# Ensure everything is executable
RUN chmod +x wledvideo run.sh

CMD [ "/app/run.sh" ]
