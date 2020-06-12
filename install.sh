#!/usr/bin/env bash
set -euo pipefail

echo Installing goimports...
cd && GO111MODULE=on go get golang.org/x/tools/cmd/goimports@master && cd - > /dev/null

echo Installing golangci-lint...
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin" v1.27.0
