SHELL := /bin/bash

.DEFAULT_GOAL := all
.PHONY: all
all: ## build pipeline
all: mod inst gen build spell lint test

.PHONY: precommit
precommit: ## validate the branch before commit
precommit: all vuln

.PHONY: ci
ci: ## CI build pipeline
ci: precommit diff

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean: ## remove files created during build pipeline
	rm -rf dist
	rm -f coverage.*
	rm -f '"$(shell go env GOCACHE)/../golangci-lint"'
	go clean -i -cache -testcache -modcache -fuzzcache -x

.PHONY: mod
mod: ## go mod tidy
	go mod tidy
	cd tools && go mod tidy

.PHONY: inst
inst: ## go install tools
	cd tools && go install $(shell cd tools && go list -e -f '{{ join .Imports " " }}' -tags=tools)

.PHONY: gen
gen: ## go generate
	go generate ./...

.PHONY: build
build: ## goreleaser build
	goreleaser build --clean --single-target --snapshot

.PHONY: spell
spell: ## misspell
	misspell -error -locale=US -w **.md

.PHONY: lint
lint: ## golangci-lint
	golangci-lint run --fix

.PHONY: vuln
vuln: ## govulncheck
	govulncheck ./...

.PHONY: test
test: ## go test
	go test -race -covermode=atomic -coverprofile=coverage.out -coverpkg=./... ./...
	go tool cover -html=coverage.out -o coverage.html

.PHONY: diff
diff: ## git diff
	git diff --exit-code
	RES=$$(git status --porcelain) ; if [ -n "$$RES" ]; then echo $$RES && exit 1 ; fi
