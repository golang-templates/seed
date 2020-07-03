.DEFAULT_GOAL := help

.PHONY: all
all: ## full build
all: install generate build fmt lint test mod-tidy build-snapshot diff

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
	go install github.com/golangci/golangci-lint/cmd/golangci-lint
	go install github.com/goreleaser/goreleaser
	go install golang.org/x/tools/cmd/goimports

.PHONY: generate
generate: ## go generate
	$(call print-target)
	go generate ./...

.PHONY: build
build: ## go build
	$(call print-target)
	go build -o /dev/null ./...

.PHONY: fmt
fmt: ## goimports
	$(call print-target)
	goimports -l -w -local github.com/golang-templates/seed . || true

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
	go test -race -covermode=atomic -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out -o coverage.html

.PHONY: mod-tidy
mod-tidy: ## go mod tidy
	$(call print-target)
	go mod tidy

.PHONY: build-snapshot
build-snapshot: ## goreleaser --snapshot --skip-publish --rm-dist
	goreleaser --snapshot --skip-publish --rm-dist

.PHONY: diff
diff: ## git diff
	$(call print-target)
	git diff --exit-code
	RES=$$(git status --porcelain) ; if [ -n "$$RES" ]; then echo $$RES && exit 1 ; fi

.PHONY: release
release: ## goreleaser --rm-dist
	go install github.com/goreleaser/goreleaser
	goreleaser --rm-dist

.PHONY: run
run: ## go run
	$(call print-target)
	go run .

.PHONY: docker
docker: ## run in golang container, example: make docker run="make all"
	docker run --rm \
		-v $(CURDIR):/repo $(args) \
		-w /repo \
		golang:1.14 $(run)

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

define print-target
    @printf "Executing target: \033[36m$@\033[0m\n"
endef
