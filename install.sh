#!/usr/bin/env bash
set -euo pipefail

echo Installing goimports...
cd && GO111MODULE=on go get golang.org/x/tools/cmd/goimports@master && cd - > /dev/null

echo Installing GolangCI-Lint...
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin" v1.26.0

echo Installing GoReleaser...
curl -sfL https://install.goreleaser.com/github.com/goreleaser/goreleaser.sh | sh
