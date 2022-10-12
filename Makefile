SHELL := /bin/bash

.DEFAULT_GOAL := dev

.PHONY: dev
dev: ## dev build
dev: mod-tidy install misspell generate lint test build

.PHONY: ci
ci: ## CI build
ci: dev diff

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean: ## remove files created during build pipeline
	$(call print-target)
	rm -rf dist
	rm -f coverage.*
	rm -f '"$(shell go env GOCACHE)/../golangci-lint"'
	go clean -i -cache -testcache -modcache -fuzzcache -x

.PHONY: mod-tidy
mod-tidy: ## go mod tidy
	$(call print-target)
	go mod tidy
	cd tools && go mod tidy

.PHONY: install
install: ## go install tools
	$(call print-target)
	cd tools && go install $(shell cd tools && go list -f '{{ join .Imports " " }}' -tags=tools)

.PHONY: misspell
misspell: ## misspell
	$(call print-target)
	misspell -error -locale=US -w **.md

.PHONY: generate
generate: ## go generate
	$(call print-target)
	go generate ./...

.PHONY: lint
lint: ## golangci-lint
	$(call print-target)
	golangci-lint run --fix

.PHONY: test
test: ## go test
	$(call print-target)
	go-acc --covermode=atomic --output=coverage.out ./... -- -race
	go tool cover -html=coverage.out -o coverage.html

.PHONY: build
build: ## goreleaser build
build:
	$(call print-target)
	goreleaser build --rm-dist --single-target --snapshot

.PHONY: diff
diff: ## git diff
	$(call print-target)
	git diff --exit-code
	RES=$$(git status --porcelain) ; if [ -n "$$RES" ]; then echo $$RES && exit 1 ; fi


define print-target
    @printf "Executing target: \033[36m$@\033[0m\n"
endef
