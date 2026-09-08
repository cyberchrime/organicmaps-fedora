.PHONY=build

IMAGE_NAME ?= opencode
IMAGE_TAG  ?= latest
CONTAINERFILE ?= Dockerfile

.PHONY: all build rebuild clean run shell

all: build

build:
	podman build \
		-t $(IMAGE_NAME) \
		-f $(CONTAINERFILE) \
		.


rebuild:
	podman build \
		--no-cache \
		-t $(IMAGE_NAME) \
		-f $(CONTAINERFILE) \
		.

clean:
	podman image rm -f $(IMAGE_NAME) || true


run:
	podman run --rm -it \
		--userns=keep-id \
		--cap-drop=ALL \
		--security-opt=no-new-privileges \
		-v $$(pwd):$$(pwd):Z \
		-w $$(pwd) \
		$(IMAGE_NAME)

shell:
	podman run --rm -it \
		--entrypoint /bin/bash \
		-v $$(pwd):$$(pwd):Z \
		-w $$(pwd) \
		$(IMAGE_NAME)
