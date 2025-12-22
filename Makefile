SHELL := /bin/bash

.DEFAULT_GOAL := all

# renovate: datasource=docker depName=ghcr.io/igorshubovych/markdownlint-cli versioning=docker
MARKDOWNLINT_VERSION = sha256:9f06c8c9a75aa08b87b235b66d618f7df351f09f08faf703177f670e38ee6511 # v0.47.0

.PHONY: all
all: ## build pipeline
all: mdlint mod gen build spell lint test

.PHONY: precommit
precommit: ## validate the branch before commit
precommit: all vuln

.PHONY: ci
ci: ## CI build pipeline
ci: precommit diff

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: mdlint
mdlint: ## markdownlint
ifneq ($(filter 1 true,$(SKIP_DOCKER)),)
	@echo "Skipping $(@) per SKIP_DOCKER=$(SKIP_DOCKER)"
else
	docker run --rm -v "$(PWD):/workdir" ghcr.io/igorshubovych/markdownlint-cli@$(MARKDOWNLINT_VERSION) "**/*.md"
endif

.PHONY: clean
clean: ## remove files created during build pipeline
	rm -rf dist
	rm -f coverage.*
	rm -f '"$(shell go env GOCACHE)/../golangci-lint"'
	go clean -i -cache -testcache -modcache -fuzzcache -x

.PHONY: run
run: ## go run
	go run .

.PHONY: mod
mod: ## go mod tidy
	go mod tidy

.PHONY: gen
gen: ## go generate
	go generate ./...

.PHONY: build
build: ## goreleaser build
	go tool goreleaser build --clean --single-target --snapshot

.PHONY: spell
spell: ## misspell
	go tool misspell -error -locale=US -w **.md

.PHONY: lint
lint: ## golangci-lint
	go tool golangci-lint run --fix

.PHONY: vuln
vuln: ## govulncheck
	go tool govulncheck ./...

ifeq ($(CGO_ENABLED),0)
RACE_OPT =
else
RACE_OPT = -race
endif

.PHONY: test
test: ## go test
	go test $(RACE_OPT) -covermode=atomic -coverprofile=coverage.out -coverpkg=./... ./...
	go tool cover -html=coverage.out -o coverage.html

.PHONY: diff
diff: ## git diff
	git diff --exit-code
	RES=$$(git status --porcelain) ; if [ -n "$$RES" ]; then echo $$RES && exit 1 ; fi
