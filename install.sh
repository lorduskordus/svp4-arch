#!/bin/bash

# Pulls the image, creates a distrobox container
# and exports mpv, Plex, SVPManager.

# Setup variables
IMAGE_NAME="svp4-arch"
CONTAINER_NAME="${IMAGE_NAME}"
EXPORT_APPS=(mpv Plex SVPManager)

# Check if container exists already
if distrobox list | grep -wq "${CONTAINER_NAME}"; then
    echo "Container '${CONTAINER_NAME}' already exists."
    echo "You can delete it using 'distrobox rm ${CONTAINER_NAME}'."
    exit 1
fi

# Check for NVIDIA HW
if lspci | grep -qi nvidia; then
    INCLUDE_NVIDIA="--nvidia"
fi

# Create the container
if ! distrobox create --yes --name ${CONTAINER_NAME} --image ghcr.io/lorduskordus/${IMAGE_NAME}:latest ${INCLUDE_NVIDIA} --no-entry; then
    echo "There was an error creating the container."
    exit 1
fi

# Export apps
for app in "${EXPORT_APPS[@]}"; do
    if ! distrobox enter --name ${CONTAINER_NAME} -- distrobox-export --app ${app}; then
        echo "Failed to export apps."
        exit 1
    fi
done
