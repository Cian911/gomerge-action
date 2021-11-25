FROM golang:1.17-alpine

ARG REPOSITORY
ARG GITHUB_TOKEN
ARG FILTER
ARG APPROVE

RUN apk upgrade && \
    go install github.com/cian911/go-merge/cmd/gomerge@848e8edd7e16642a913729e100d9ac4955018713

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
