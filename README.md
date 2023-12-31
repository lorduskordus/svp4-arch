# SVP4-Arch

[![build-svp4-arch](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml/badge.svg)](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml)

An Arch container that's ready for **Smooth Video Project** usage.

Preinstalled:

* SVP4
* MPV (preconfigured to work with SVP and HW decoding)
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

For the most painless way, just use the [install.sh](https://github.com/lorduskordus/svp4-arch/blob/main/install.sh) script. All it really does is choose the right image and automatically exports plex-desktop and SVPManager.

Alternatively:

#### Intel / AMD
```
distrobox-create --name svp4-arch --image ghcr.io/lorduskordus/svp4-arch:latest --no-entry
```

#### NVIDIA
```
distrobox-create --name svp4-arch --image ghcr.io/lorduskordus/svp4-arch-nvidia:latest --no-entry
```

#### Export the apps to host
```
distrobox-enter --name svp4-arch -- distrobox-export --app plex-desktop
distrobox-enter --name svp4-arch -- distrobox-export --app SVPManager
```