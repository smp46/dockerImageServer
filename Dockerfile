# Provide opencontainers label
LABEL org.opencontainers.image.source="https://github.com/smp46/dockerImageServer"

# Use the official Nginx image as the base
FROM nginx:alpine

# Install curl
RUN apk add --no-cache curl

# Set a default image URL
ENV IMAGE_URL=http://default/image/url

# Copy the script into the container
COPY fetch-image.sh /usr/local/bin/fetch-image.sh

# Make the script executable
RUN chmod +x /usr/local/bin/fetch-image.sh

# Use a custom entrypoint script to download the image and start Nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Add your custom server config to Nginx's conf.d directory
COPY image_server.conf /etc/nginx/conf.d/

# Make sure the HTML directory is empty except for the image
RUN rm -rf /usr/share/nginx/html/*

# Set the entrypoint script to be executed
ENTRYPOINT ["/entrypoint.sh"]

# By default, start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

