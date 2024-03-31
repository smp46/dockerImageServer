#!/bin/sh
# entrypoint.sh

# Start Nginx in the background
nginx -g 'daemon off;' &

# Infinite loop to update the image every 5 seconds
while true; do
  /usr/local/bin/fetch-image.sh  # Download the image
  sleep 1                        # Wait for 5 seconds
done

