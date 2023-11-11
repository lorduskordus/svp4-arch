FROM ghcr.io/ublue-os/arch-distrobox:latest AS svp4-arch

# Copy mpv config.
COPY files /

# Install drivers (excluding NVIDIA).
RUN pacman -S \
        libva-mesa-driver \
        intel-media-driver \
        --noconfirm

# Add build user.
RUN useradd -m --shell=/bin/bash build && usermod -L build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install plex-desktop, install SVP4,
# switch to mpv with vapoursynth.
USER build
RUN paru -S \
        aur/plex-desktop \
        aur/svp \
        --noconfirm && \
    sudo pacman -Rdd mpv --noconfirm && \
    paru -S aur/mpv-vapoursynth --noconfirm

# Cleanup.
USER root
RUN userdel -r build && \
    sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*

FROM svp4-arch AS svp4-arch-nvidia

# Install NVIDIA drivers.
RUN pacman -S \
        nvidia-utils \
        opencl-nvidia \
        --noconfirm

# Cleanup.
RUN rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*