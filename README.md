# Go Library Template

[![Build Status](https://github.com/golang-templates/library/workflows/build/badge.svg)](https://github.com/golang-templates/library/actions?query=workflow%3Abuild)
[![GoDoc](https://godoc.org/github.com/golang-templates/library?status.svg)](https://godoc.org/github.com/golang-templates/library)
[![GitHub Release](https://img.shields.io/github/release/golang-templates/library.svg)](https://github.com/golang-templates/library/releases)
[![Go Report Card](https://goreportcard.com/badge/github.com/golang-templates/library)](https://goreportcard.com/report/github.com/golang-templates/library)

This is GitHub project template for a Go library. It has been created for ease-of-use for anyone who wants to:

- quickly get into Go without losing too much time on environment setup,
- create a new repoisitory with basic Continous Integration.

It includes:

- [Visual Studio Code](https://code.visualstudio.com) configuration with [Go](https://code.visualstudio.com/docs/languages/go) and [Remote Container](https://code.visualstudio.com/docs/remote/containers) support,
- dependency management using [Go Modules](https://github.com/golang/go/wiki/Modules),
- linting with [GolangCI-Lint](https://github.com/golangci/golangci-lint),
- build automation via [Make](https://www.gnu.org/software/make), [Docker](https://docs.docker.com/engine), [Docker Compose](https://docs.docker.com/compose), [GitHub Actions](https://github.com/features/actions).

`Star` this project if you find it valuable and worth maintaining.

## Usage

1. Click the `Use this template` button (alt. clone or download this repository).
1. Replace all occurences of `golang-templates/library` to `your_org/repo_name` in all files.
1. Change [LICENSE](LICENSE) and [README.md](README.md).

### Setup Development Environment

Take notice that this project is build in a way that gives developers a lot of freedom on development environments setup. Below you can find proposals when using Visual Studio Code.

- **Bare metal:** See [Dockerfile](Dockerfile) for GolangCI-Lint installation command.
- **Containers:** [Instructions](https://code.visualstudio.com/docs/remote/containers).
- **Remote via SSH**: [Instructions](https://code.visualstudio.com/docs/remote/ssh).

### Build

- Terminal: `make all`.
- Visual Studio Code: `Terminal` → `Run Build Task... (CTRL+ALT+B)` → Select `All`.
- Terminal: `docker-compose up --abort-on-container-exit`. This command is executed by CI build (GitHub Action workflow).

### Maintainance

1. `Watch` this project to get notified about new releases, issues, etc.
1. Update Go and GolangCI-Lint version in [Dockerfile](Dockerfile). Take notice that when working on non-container environment, then you should have to do it manually on the machine.
1. Configure linters via [.golangci.yml](.golangci.yml).
1. Develop Make targets in [Makefile](Makefile) and assosiated tasks in [.vscode/tasks.json](.vscode/tasks.json).

Notable files:

- [devcontainer.json](.devcontainer/devcontainer.json) - Visual Studio Code Remote Container configuration
- [.github](.github/workflows/build.yml) - GitHub Action workflow (CI build)
- [.vscode](.vscode) - Visual Studio Code configuration files
- [.golangci.yml](.golangci.yml) - GolangCI-Lint configuration
- [docker-compose.yml](docker-compose.yml) - Compose file used in [CI build](.github/workflows/build.yml)
- [Dockerfile](Dockerfile) - Builder image used in [docker-compose.yml](docker-compose.yml) and [devcontainer.json](.devcontainer/devcontainer.json)
- [Makefile](Makefile) - Make targets used in [docker-compose.yml](docker-compose.yml) and [.vscode/tasks.json](.vscode/tasks.json)

## FAQ

### Make does not work on Windows

You can use [WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or try [Make Windows port](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058).

### Why nothing for GoLand

The maintainer does not use GoLand. Fell free to create a pull request for [#2](https://github.com/golang-templates/library/issues/2).

### Why GitHub Actions, not any other CI server

GitHub Actions is out-of-the-box if you are already using GitHub.
However, changing to any other CI server should be very simple, because this repository uses Docker Compose to run CI build to make the transition easy.

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
