#!/usr/bin/with-contenv bashio

WLED_HOST=$(bashio::config 'wled_host')
WIDTH=$(bashio::config 'matrix_width')
HEIGHT=$(bashio::config 'matrix_height')
MEDIA_DIR=$(bashio::config 'media_dir')
LOOPS_PER_VIDEO=$(bashio::config 'loops_per_video')

bashio::log.info "Starting WLED GIF Player..."

# Ensure directory exists to avoid ls errors
if [ ! -d "$MEDIA_DIR" ]; then
    bashio::log.error "Directory $MEDIA_DIR does not exist!"
    exit 1
fi

while true; do
    # 1. Get the list of gifs, shuffle them just like the OG script
    MAPFILE=($(ls -1 "$MEDIA_DIR"/*.gif 2>/dev/null | shuf))

    if [ ${#MAPFILE[@]} -gt 0 ]; then
        for FULLPATH in "${MAPFILE[@]}"; do
            [ -f "$FULLPATH" ] || continue
            FILE_NAME=$(basename "$FULLPATH")

            # 2. Replicate the nested loop for playback count
            for ((i=1; i<=LOOPS_PER_VIDEO; i++)); do
                bashio::log.info "Playing $FILE_NAME (loop $i/$LOOPS_PER_VIDEO)"

                python3 wled-source/wledvideo.py \
                    --host "$WLED_HOST" \
                    --width "$WIDTH" \
                    --height "$HEIGHT" \
                    "$FULLPATH"
            done
        done
    else
        bashio::log.warning "No GIFs found in $MEDIA_DIR. Waiting 10 seconds..."
        sleep 10
    fi
done
