# Go
FROM golang:1.14.2
# mage
RUN GO111MODULE=on go get github.com/magefile/mage@v1.9.0
# golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.26.0
