# Go Library Template

[![Build Status](https://github.com/golang-templates/library/workflows/build/badge.svg)](https://github.com/golang-templates/library/actions?query=workflow%3Abuild)
[![GoDoc](https://godoc.org/github.com/golang-templates/library?status.svg)](https://godoc.org/github.com/golang-templates/library)
[![GitHub Release](https://img.shields.io/github/release/golang-templates/library.svg)](https://github.com/golang-templates/library/releases)
[![Go Report Card](https://goreportcard.com/badge/github.com/golang-templates/library)](https://goreportcard.com/report/github.com/golang-templates/library)

This is GitHub project template for a Go library. It has been created for ease-of-use for anyone who wants to:

- quickly get into Go without losing too much time on environment setup,
- create a new repoisitory with basic Continous Integration,
- write Go code on Linux, MacOS, Windows.

It includes:

- [Visual Studio Code](https://code.visualstudio.com) config with [Go](https://code.visualstudio.com/docs/languages/go) and [Remote Container](https://code.visualstudio.com/docs/remote/containers) support,
- dependency management using [Go Modules](https://github.com/golang/go/wiki/Modules),
- linting with [GolangCI-Lint](https://github.com/golangci/golangci-lint),
- build automation via [Mage](https://magefile.org), [Docker](https://docs.docker.com/engine), [Docker Compose](https://docs.docker.com/compose), [GitHub Actions](https://github.com/features/actions).

`Star` this project if you find it valuable and worth maintaining.

## Usage

1. Click the `Use this template` button (alt. clone or download this repository).
1. Replace all occurences of `golang-templates/library` to `your_org/repo_name` in all files.
1. Change [LICENSE](LICENSE) and [README.md](README.md).

### Setup Development Environment

Take notice that this project is build in a way that gives the developer a lot of freedom on the development environment setup. Below you can find proposals when using Visual Studio Code.

- **Bare metal:** Install Go, Visual Studio Code, Mage and GolangCI-Lint (see [Dockerfile](Dockerfile) for Mage and GolangCI-Lint installation commands).
- **Containers:** Install Docker, Visual Studio Code with Remote - Container extension. [Instructions](https://code.visualstudio.com/docs/remote/containers).
- **Remote via SSH**: [Instructions](https://code.visualstudio.com/docs/remote/ssh).

### Build

- Terminal: `mage -v all`.
- Visual Studio Code: `Terminal` → `Run Build Task... (CTRL+ALT+B)` → Select `All`.
- Terminal: `docker-compose up --abort-on-container-exit`. This command is executed by CI build (GitHub Action workflow).

### Maintainance

1. `Watch` this project to get notified about new releases, issues, etc.
1. Update Go, Mage and GolangCI-Lint version in [Dockerfile](Dockerfile). Take notice that when working on bare metal or via SSH, then you should also to do it manually on your machine.
1. Configure linters via [.golangci.yml](.golangci.yml).
1. Develop Mage targets in [magefile.go](magefile.go) and assosiated tasks in [.vscode/tasks.json](.vscode/tasks.json).

Notable files:

- [.devcontainer](.devcontainer/devcontainer.json) - Visual Studio Code Remote Cotainer configs
- [.github](.github/workflows/build.yml) - GitHub Action workflow (CI build)
- [.vscode](.vscode) - Visual Studio Code configs
- [.golangci.yml](.golangci.yml) - GolangCI-Lint config
- [docker-compose.yml](docker-compose.yml) - Compose file used in [CI Build](.github/workflows/build.yml)
- [Dockerfile](Dockerfile) - Builder image used in [docker-compose.yml](docker-compose.yml) and [.devcontainer](.devcontainer/devcontainer.json)
- [magefile.go](magefile.go) - Mage targets used in [docker-compose.yml](docker-compose.yml) and [.vscode/tasks.json](.vscode/tasks.json)

## FAQ

### Why Mage instead of Make

Here is [why](https://github.com/magefile/mage#why).
However, updating to Make is pretty straightforward.

1. Replace [magefile.go](magefile.go) with a `Makefile` file:

```make
.DEFAULT_GOAL := help

.PHONY: all
all: ## full build: build, lint, test
all: build lint test 

.PHONY: build
build: ## go build
	go build ./...

.PHONY: lint
lint: ## golangci-lint
	golangci-lint run

.PHONY: test
test: ## go test with race detector and code covarage
	go test -race -covermode=atomic

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
```

1. Remove Mage installation from [Dockerfile](Dockerfile).
1. Update [docker-compose.yml](docker-compose.yml) and [.vscode/tasks.json](.vscode/tasks.json) to use `make`.

If you are developing on Windows then you can:

1. install Docker and Visual Studio Code Remote Container extension,
1. use [WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and [Visual Studio Code Remote SSH extension](https://code.visualstudio.com/docs/remote/wsl),
1. install [Make Windows port to Git Bash](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058).

### Why nothing for GoLand

The maintainer does not use GoLand. Fell free to create a pull request which should contain:

- GoLand config to use golangci-lint,
- GoLand config for Mage targets (like [.vscode/tasks.json](.vscode/tasks.json) for Visua Studio Code),
- update [.gitignore](.gitignore) if required.
- update README(README.md) if possible.

### Why GitHub Actions, not any other CI server

GitHub Actions is out-of-the-box if you are already using GitHub.
However, changing to any other CI server should be very simple, becasue this repo uses Docker Compose to run CI build to make the transition easy.

For [CircleCI](https://circleci.com/docs/2.0/executor-types/#using-machine) create `.circleci/config.yml` file:

```yml
version: 2.1
jobs:
  build:
    machine:
      image: ubuntu-1604:201903-01
    steps:
      - checkout
      - run: docker-compose up --abort-on-container-exit
```

## Contributing

Simply create an issue or a pull request.
