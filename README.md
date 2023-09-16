# SVP4-Arch

[![build-svp4-arch](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml/badge.svg)](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml)

An Arch container that's ready for **Smooth Video Project** usage. Ideal for the Steam Deck.

Preinstalled (using AUR helper paru):

* SVP4
* MPV with vapoursynth + configured to work with SVP and HW decoding
* Plex Desktop

## Images

##### Intel / AMD
```
podman pull ghcr.io/lorduskordus/svp4-arch:latest
```
##### NVIDIA
```
podman pull ghcr.io/lorduskordus/svp4-arch-nvidia:latest
```

## Installation

For the most painless way, just use the `install.sh` script. All it really does is choose the right image and automatically exports mpv, plex-desktop and SVPManager.

Alternatively:

#### Intel / AMD
```
distrobox create -n svp4-arch -i ghcr.io/lorduskordus/svp4-arch:latest
```

#### NVIDIA
```
distrobox create -n svp4-arch -i ghcr.io/lorduskordus/svp4-arch-nvidia:latest
```

This will set you up with everything except you'll have to manually export the apps.

### Install podman & distrobox on Steam Deck
* Follow [this guide](https://github.com/89luca89/distrobox/blob/main/docs/posts/steamdeck_guide.md) from distrobox git.