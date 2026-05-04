# Using the Home Assistant Debian-based image
FROM ghcr.io/home-assistant/amd64-base-debian:bookworm

# Install Python and system-level media dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-dev \
    ffmpeg \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Ensure we use the right pip and install requirements
COPY wled-source/requirements.txt .
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

# Copy your source code
COPY . .

# Execution command
RUN chmod a+x run.sh

CMD [ "/app/run.sh" ]
