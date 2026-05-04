ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.12-alpine3.19
FROM $BUILD_FROM

# Install system dependencies
RUN apk add --no-cache \
    ffmpeg \
    libgcc \
    libstdc++ \
    libjpeg-turbo \
    openblas

WORKDIR /app

# Copy everything (including the wled-video subfolder)
COPY . .

# Install dependencies from the subfolder
RUN pip3 install --no-cache-dir -r wled-source/requirements.txt

# Ensure the run script is executable
RUN chmod a+x run.sh

CMD [ "/app/run.sh" ]
