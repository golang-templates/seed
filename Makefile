.DEFAULT_GOAL := help

.PHONY: all
all: ## full build: build, lint, test
all: install build lint test

.PHONY: install
install: ## install build tools
	$(call print-target)
	./install.sh

.PHONY: build
build: ## go build
	$(call print-target)
	go build ./...

.PHONY: lint
lint: ## golangci-lint
	$(call print-target)
	golangci-lint run

.PHONY: test
test: ## go test with race detector and code covarage
	$(call print-target)
	go test -race -covermode=atomic

.PHONY: ci-build
ci-build:
	docker run --rm -v $(CURDIR):/app golang:1.14 sh -c "cd /app && make all"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

define print-target
    @echo "Executing target: \033[36m$@\033[0m"
endef
