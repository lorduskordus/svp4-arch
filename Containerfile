FROM ghcr.io/ublue-os/arch-distrobox:latest AS svp4-arch

COPY config /etc

RUN pacman -Syu --noconfirm && \
    useradd -m --shell=/bin/bash build && usermod -L build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \

    pacman -S \
        intel-media-driver \
        libva-mesa-driver \
        mesa-vdpau \
        mpv \
        --noconfirm

USER build
RUN paru -S \
        aur/plex-desktop \
        aur/svp-bin \
        --noconfirm

USER root
RUN userdel -r build && \
    sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*
