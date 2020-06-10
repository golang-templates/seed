.DEFAULT_GOAL := help

.PHONY: all
all: ## full build
all: install generate build mod-tidy fmt lint test release diff

.PHONY: dev
dev: ## fast build
dev: build fmt lint-fast test

.PHONY: clean
clean: ## go clean
	$(call print-target)
	go clean -r -i -cache -testcache -modcache

.PHONY: install
install: ## install build tools
	$(call print-target)
	./install.sh

.PHONY: generate
generate: ## go generate
	$(call print-target)
	go generate ./...

.PHONY: build
build: ## go build
	$(call print-target)
	go build ./...

.PHONY: mod-tidy
mod-tidy: ## go mod tidy
	$(call print-target)
	go mod tidy
	git diff --exit-code -- go.mod go.sum

.PHONY: fmt
fmt: ## goimports
	$(call print-target)
	@# ignore the goimports exit code as the generated code may be reformated
	goimports -l -w . || true
	git diff --exit-code

.PHONY: lint
lint: ## golangci-lint
	$(call print-target)
	golangci-lint run

.PHONY: lint-fast
lint-fast: ## golangci-lint --fast
	$(call print-target)
	golangci-lint run --fast

.PHONY: test
test: ## go test with race detector and code covarage
	$(call print-target)
	go test -race -covermode=atomic ./...

.PHONY: release
release: ## goreleaser --snapshot --skip-publish --rm-dist
	$(call print-target)
	goreleaser --snapshot --skip-publish --rm-dist

.PHONY: diff
diff: ## git diff
	$(call print-target)
	git diff --exit-code
	test -z "`git status --porcelain`"

.PHONY: docker
docker: ## run in golang container, example: make docker run="make all"
	docker run --rm -v $(CURDIR):/app $(args) golang:1.14 sh -c "cd /app && $(run)"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

define print-target
    @printf "Executing target: \033[36m$@\033[0m\n"
endef
