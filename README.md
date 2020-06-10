# Go Repository Template

[![GitHub Release](https://img.shields.io/github/v/release/golang-templates/seed)](https://github.com/golang-templates/seed/releases)
[![go.dev](https://img.shields.io/badge/go.dev-reference-blue.svg)](https://pkg.go.dev/github.com/golang-templates/seed)
[![go.mod](https://img.shields.io/github/go-mod/go-version/golang-templates/seed)](go.mod)
[![Build Status](https://img.shields.io/github/workflow/status/golang-templates/seed/build)](https://github.com/golang-templates/seed/actions?query=workflow%3Abuild+branch%3Amaster)
[![Go Report Card](https://goreportcard.com/badge/github.com/golang-templates/seed)](https://goreportcard.com/report/github.com/golang-templates/seed)

This is a GitHub repository template for Go. It has been created for ease-of-use for anyone who wants to:

- quickly get into Go without losing too much time on environment setup,
- create a new repoisitory with basic Continous Integration.

It includes:

- [Visual Studio Code](https://code.visualstudio.com) configuration with [Go](https://code.visualstudio.com/docs/languages/go) and [Remote Container](https://code.visualstudio.com/docs/remote/containers) support,
- dependency management using [Go Modules](https://github.com/golang/go/wiki/Modules),
- linting with [golangci-lint](https://github.com/golangci/golangci-lint),
- build automation via [Make](https://www.gnu.org/software/make), [Docker](https://docs.docker.com/engine), [GitHub Actions](https://github.com/features/actions),
- releasing using [GoReleaser](https://github.com/goreleaser/goreleaser).

`Star` this repository if you find it valuable and worth maintaining.

`Watch` this repository to get notified about new releases, issues, etc.

## Usage

1. Click the `Use this template` button (alt. clone or download this repository).
1. Replace all occurences of `golang-templates/seed` to `your_org/repo_name` in all files.
1. Change [LICENSE](LICENSE) and [README.md](README.md).

### Build

- Terminal: `make` to get help for make targets.
- Terminal: `make all` to execute a full build.
- Visual Studio Code: `Terminal` → `Run Build Task... (CTRL+ALT+B)` to execute a fast build.

### Maintainance

Remember to update Go version in [.github/workflows](.github/workflows), [Makefile](Makefile) and [devcontainer.json](.devcontainer/devcontainer.json).

Notable files:
- [devcontainer.json](.devcontainer/devcontainer.json) - Visual Studio Code Remote Container configuration
- [.github/workflows](.github/workflows) - GitHub Actions workflows
- [.vscode](.vscode) - Visual Studio Code configuration files
- [.golangci.yml](.golangci.yml) - golangci-lint configuration
- [.goreleaser.yml](.goreleaser.yml) - GoReleaser configuration
- [install.sh](install.sh) - build tools installation script
- [Makefile](Makefile) - Make targets used for development, [CI build](.github/workflows) and [.vscode/tasks.json](.vscode/tasks.json)

## FAQ

### Why Visual Studio Code editor configuration

Developers that use Visual Studio Code can take advantage of the editor configuration. While others do not have to care about it. Setting configs for each repo is unnecessary time consuming. VS Code is the most popular Go editor ([survey](https://blog.golang.org/survey2019-results)) and it is officially [supported by the Go team](https://blog.golang.org/vscode-go). You can always remove the [.vscode](.vscode) directory and update [.gitignore](.gitignore) if it really does not help you.

### Why nothing for GoLand

The maintainer does not use GoLand. Fell free to create a pull request for [#2](https://github.com/golang-templates/seed/issues/2).

### Why GitHub Actions, not any other CI server

GitHub Actions is out-of-the-box if you are already using GitHub.
However, changing to any other CI server should be very simple, because this repository has build logic and tooling installation in Makefile. You can also use the `docker` make target to run the build inside a docker container.

### How can I use Make on Windows

Use [WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or try [Make Windows port](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058).

## Contributing

Simply create an issue or a pull request.
