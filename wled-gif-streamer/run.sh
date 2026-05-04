#!/usr/bin/with-contenv bashio

WLED_HOST=$(bashio::config 'wled_host')
WIDTH=$(bashio::config 'matrix_width')
HEIGHT=$(bashio::config 'matrix_height')
MEDIA_DIR="/share/wled_gifs"

bashio::log.info "Starting WLED-video Streamer from subfolder..."

while true; do
    if ls "$MEDIA_DIR"/*.gif >/dev/null 2>&1; then
        for FILE in "$MEDIA_DIR"/*.gif; do
            [ -e "$FILE" ] || continue
            bashio::log.info "Streaming $(basename "$FILE")"
            
            # Note the path to the script: wled-video/wledvideo.py
            python3 wled-source/wledvideo.py \
                --host "$WLED_HOST" \
                --width "$WIDTH" \
                --height "$HEIGHT" \
                --loop 1 \
                "$FILE"
        done
    else
        bashio::log.warning "No GIFs found in $MEDIA_DIR. Waiting 10 seconds..."
        sleep 10
    fi
done
