#!/bin/bash

# Pulls the image, creates a distrobox container and
# exports mpv, plex-desktop, SVPManager.

# Setup variables
CONTAINER_NAME="svp4-arch"
IMAGE="svp4-arch"
EXPORT_APPS=(mpv plex-desktop SVPManager)

# Check if container exists already
if distrobox list | grep -wq "$CONTAINER_NAME"; then
    echo "Container '$CONTAINER_NAME' already exists."
    echo "You can delete it using 'distrobox rm $CONTAINER_NAME'."
    exit 1
fi

# Check for NVIDIA HW
if lspci | grep -qi nvidia; then
    IMAGE="$IMAGE-nvidia"
fi

# Create the container
distrobox create -n $CONTAINER_NAME \
                 -i ghcr.io/lorduskordus/$IMAGE:latest

# Export apps
for app in "${EXPORT_APPS[@]}"; do
    distrobox enter -n $CONTAINER_NAME \
        -- distrobox-export --app ${app}
done