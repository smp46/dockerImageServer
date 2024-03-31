#!/bin/sh
# fetch-image.sh

# Read the image URL from an environment variable
IMAGE_URL="${IMAGE_URL:-http://default/image/url}"

# Output directory
OUTPUT_DIR="/usr/share/nginx/html"
OUTPUT_FILE="${OUTPUT_DIR}/image.jpg"

# Create output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Download the image using curl
curl -o "${OUTPUT_FILE}" "${IMAGE_URL}"

