# Zyn-Fusion-Fedora

A Dockerfile to build [Organic Maps](https://github.com/organicmaps/organicmaps/) for Fedora.

Currently tested for :

- Fedora 38
- x86_64 architectures

## Requirements

```bash
sudo dnf install -y podman make
```

## Usage

```bash
make
```


## FEDORA\_VERSION

You can set your Fedora version in the file `FEDORA_VERSION`.

## Sources

This repository was derived from [Signal-Desktop-Fedora](https://github.com/BarbossHack/Signal-Desktop-Fedora).
