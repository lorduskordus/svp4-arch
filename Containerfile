FROM quay.io/toolbx-images/archlinux-toolbox:latest AS svp4-arch

COPY files /

# Update the system.
RUN pacman -Syu --noconfirm

# Install needed packages.
RUN pacman -S \
        base-devel \
        libva-mesa-driver \
        intel-media-driver \
        --noconfirm

# Add build user.
RUN useradd -m --shell=/bin/bash build && usermod -L build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Add paru AUR helper.
USER build
WORKDIR /home/build
RUN git clone https://aur.archlinux.org/paru-bin.git --single-branch && \
    cd paru-bin && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -drf paru-bin

# Install plex-desktop, switch to mpv with vapoursynth, install SVP4.
RUN paru -S aur/plex-desktop --noconfirm && \
    sudo pacman -Rdd mpv --noconfirm && \
    paru -S aur/mpv-vapoursynth --noconfirm \
    paru -S aur/svp --noconfirm

# Cleanup.
USER root
WORKDIR /
RUN userdel -r build && \
    rm -drf /home/build && \
    sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*

FROM svp4-arch AS svp4-arch-nvidia

# Install packages for NVIDIA.
RUN pacman -S \
        nvidia-utils \
        opencl-nvidia \
        --noconfirm

# Cleanup.
RUN rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*