[![Build Status](https://github.com/golang-templates/library/workflows/build/badge.svg)](https://github.com/golang-templates/library/actions?query=workflow%3Abuild)
[![GoDoc](https://godoc.org/github.com/golang-templates/library?status.svg)](https://godoc.org/github.com/golang-templates/library)
[![GitHub Release](https://img.shields.io/github/release/golang-templates/library.svg)](https://github.com/golang-templates/library/releases)
[![Go Report Card](https://goreportcard.com/badge/github.com/golang-templates/library)](https://goreportcard.com/report/github.com/golang-templates/library)

# Go Library Template

This is GitHub project template for a Go library. It has been created for ease-of-use for anyone who wants to:

- quickly get into Go without losing too much time on environment setup,
- create a new repoisitory with basic Continous Integration,
- write Go code on Linux, MacOS, Windows,
- use free tools.

It includes:

- editor config: [Visual Studio Code](https://code.visualstudio.com)  with [Go](https://code.visualstudio.com/docs/languages/go) and [Remote Container](https://code.visualstudio.com/docs/remote/containers) support,
- dependency management: [Go Modules](https://github.com/golang/go/wiki/Modules),
- linter: [GolangCI-Lint](https://github.com/golangci/golangci-lint),
- build automation: [Mage](https://magefile.org), [Docker](https://docs.docker.com/engine), [Docker Compose](https://docs.docker.com/compose), [GitHub Actions](https://github.com/features/actions).

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
1. Develop tasks/targets in [magefile.go](magefile.go) and [.vscode/tasks.json](.vscode/tasks.json).

## Contributing

Simply create an issue or a pull request.
