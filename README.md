# SVP4-Arch

[![build-svp4-arch](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml/badge.svg)](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml)

An Arch container that's ready for **Smooth Video Project** usage.

Preinstalled (using AUR helper paru):

* SVP4
* MPV with vapoursynth + configured to work with SVP and HW decoding
* Plex Desktop

## Images

##### Intel / AMD
```
ghcr.io/lorduskordus/svp4-arch:latest
```
##### NVIDIA
```
ghcr.io/lorduskordus/svp4-arch-nvidia:latest
```

## Installation (distrobox)

For the most painless way, just use the `install.sh` script. All it really does is choose the right image and automatically exports plex-desktop and SVPManager.

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