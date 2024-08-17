FROM ghcr.io/ublue-os/arch-distrobox:latest AS svp4-arch

# Update the system & add build user
RUN pacman -Syu --noconfirm && \
    useradd -m --shell=/bin/bash build && usermod -L build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install Intel & AMD drivers
RUN pacman -S \
        intel-media-driver \
        libva-mesa-driver \
        mesa-vdpau \
        --noconfirm

# Install mpv & copy mpv config
RUN pacman -S mpv --noconfirm
COPY files /etc

# Install plex-desktop and SVP4
USER build
RUN paru -S \
        aur/plex-desktop \
        aur/svp-bin \
        --noconfirm

# Cleanup
USER root
RUN userdel -r build && \
    sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*
