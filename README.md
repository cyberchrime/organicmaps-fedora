# CoMaps-Fedora

A Dockerfile to build [CoMaps](https://codeberg.org/comaps/comaps/) for Fedora.

Currently tested for :

- Fedora 42
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

You can set your Fedora version in the `Makefile`.

## Sources

This repository was derived from [Signal-Desktop-Fedora](https://github.com/BarbossHack/Signal-Desktop-Fedora).
