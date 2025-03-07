# SVP4 Arch &nbsp; [![build-svp4-arch](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml/badge.svg)](https://github.com/lorduskordus/svp4-arch/actions/workflows/build.yml)

An Arch container that's ready for **Smooth Video Project** usage.

> [!NOTE]
> The image is meant to be used with [distrobox](https://github.com/89luca89/distrobox), ensure you have it [installed](https://github.com/89luca89/distrobox?tab=readme-ov-file#installation).

Preinstalled:

* SVP4
* MPV (preconfigured to work with SVP and HW decoding)
* Plex Desktop

## Image

```
ghcr.io/lorduskordus/svp4-arch
```

## Installation (distrobox)

#### For the most painless way, just use the [install.sh](https://github.com/lorduskordus/svp4-arch/blob/main/install.sh) script:


```
curl -s https://raw.githubusercontent.com/lorduskordus/svp4-arch/main/install.sh | bash
```

#### Manual installation:

##### Intel / AMD
```
distrobox create --name svp4-arch --image ghcr.io/lorduskordus/svp4-arch:latest --no-entry
```

##### NVIDIA
```
distrobox create --name svp4-arch --image ghcr.io/lorduskordus/svp4-arch:latest --nvidia --no-entry
```

##### Export the apps to host
```
distrobox enter --name svp4-arch -- distrobox-export --app mpv
distrobox enter --name svp4-arch -- distrobox-export --app Plex
distrobox enter --name svp4-arch -- distrobox-export --app SVPManager
```
