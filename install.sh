#!/bin/bash
set -euo pipefail

if ! [ -x "$(command -v golangci-lint)" ] || [ "$(golangci-lint --version)" != "golangci-lint has version 1.27.0 built from fb74c2e on 2020-05-13T18:48:26Z" ] ; then
    echo Installing golangci-lint...
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.27.0
fi
