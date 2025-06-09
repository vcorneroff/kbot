FROM --platform=$BUILDPLATFORM quay.io/projectquay/golang:1.24 AS builder

ARG BUILDPLATFORM

WORKDIR /go/src/app
COPY . .
RUN export TARGETARCH=$(echo $BUILDPLATFORM | cut -d'/' -f2)
RUN echo $TARGETARCH
RUN make $TARGETARCH

FROM --platform=linux/amd64 alpine:latest AS certs
RUN apk add --no-cache ca-certificates

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/kbot .
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./kbot" ]