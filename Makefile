.PHONY=build

FEDORA_VERSION=$$(cat ./FEDORA_VERSION)
ARCH=$$(if [[ "$$(uname -m)" == "aarch64" ]]; then echo "arm64v8"; else echo "amd64"; fi)


all: build

build:
	@mkdir -p output
	@podman build --build-arg=ARCH=$(ARCH) --build-arg=FEDORA_VERSION=$(FEDORA_VERSION) -t organicmaps:latest .
	@podman run -it --rm -v $$PWD:/ws:Z organicmaps:latest
