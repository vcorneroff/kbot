APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=ghcr.io/vcorneroff
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
#TARGETARCH=$(shell dpkg --print-architecture)
TARGETARCH=arm64

dependencies:
	go get

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

build: format dependencies
	CGO_ENABLED=0 GOOS=$(TARGETOS) GOARCH=$(TARGETARCH) go build -v -o kbot -ldflags "-X="github.com/vcorneroff/kbot/cmd.appVersion=$(VERSION)

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot
