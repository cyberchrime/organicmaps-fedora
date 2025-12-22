.PHONY=build

FEDORA_VERSION=42
ARCH=$$(if [[ "$$(uname -m)" == "aarch64" ]]; then echo "arm64v8"; else echo "amd64"; fi)


all: build

build:
	@mkdir -p output
	@podman build --build-arg=ARCH=$(ARCH) --build-arg=FEDORA_VERSION=$(FEDORA_VERSION) -t comaps:latest .
	@podman run -it --rm -v $$PWD:/ws:Z comaps:latest
