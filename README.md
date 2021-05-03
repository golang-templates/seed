# Go Repository Template

[![Keep a Changelog](https://img.shields.io/badge/changelog-Keep%20a%20Changelog-%23E05735)](CHANGELOG.md)
[![GitHub Release](https://img.shields.io/github/v/release/golang-templates/seed)](https://github.com/golang-templates/seed/releases)
[![Go Reference](https://pkg.go.dev/badge/github.com/golang-templates/seed.svg)](https://pkg.go.dev/github.com/golang-templates/seed)
[![go.mod](https://img.shields.io/github/go-mod/go-version/golang-templates/seed)](go.mod)
[![LICENSE](https://img.shields.io/github/license/golang-templates/seed)](LICENSE)
[![Build Status](https://img.shields.io/github/workflow/status/golang-templates/seed/build)](https://github.com/golang-templates/seed/actions?query=workflow%3Abuild+branch%3Amain)
[![Go Report Card](https://goreportcard.com/badge/github.com/golang-templates/seed)](https://goreportcard.com/report/github.com/golang-templates/seed)
[![Codecov](https://codecov.io/gh/golang-templates/seed/branch/main/graph/badge.svg)](https://codecov.io/gh/golang-templates/seed)

This is a GitHub repository template for Go. It has been created for ease-of-use for anyone who wants to:

- quickly get into Go without losing too much time on environment setup,
- create a new repoisitory with basic Continous Integration.

It includes:

- continous integration via [GitHub Actions](https://github.com/features/actions),
- build automation via [Make](https://www.gnu.org/software/make),
- dependency management using [Go Modules](https://github.com/golang/go/wiki/Modules),
- code formatting using [gofumpt](https://github.com/mvdan/gofumpt),
- linting with [golangci-lint](https://github.com/golangci/golangci-lint),
- unit testing with [testify](https://github.com/stretchr/testify), [race detector](https://blog.golang.org/race-detector), code covarage [HTML report](https://blog.golang.org/cover) and [Codecov report](https://codecov.io/),
- releasing using [GoReleaser](https://github.com/goreleaser/goreleaser),
- dependencies scanning and updating thanks to [Dependabot](https://dependabot.com),
- security code analysis using [CodeQL Action](https://docs.github.com/en/github/finding-security-vulnerabilities-and-errors-in-your-code/about-code-scanning),
- [Visual Studio Code](https://code.visualstudio.com) configuration with [Go](https://code.visualstudio.com/docs/languages/go) and [Remote Container](https://code.visualstudio.com/docs/remote/containers) support.

`Star` this repository if you find it valuable and worth maintaining.

`Watch` this repository to get notified about new releases, issues, etc.

## Usage

1. Sign up on [Codecov](https://codecov.io/) and configure [Codecov GitHub Application](https://github.com/apps/codecov) for all repositories.
1. Click the `Use this template` button (alt. clone or download this repository).
1. Replace all occurences of `golang-templates/seed` to `your_org/repo_name` in all files.
1. Replace all occurences of `seed` to `repo_name` in [Dockerfile](Dockerfile).
1. Update the following files:
   - [CHANGELOG.md](CHANGELOG.md)
   - [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
   - [LICENSE](LICENSE)
   - [README.md](README.md)

## Setup

Below you can find sample instructions on how to set up the development environment.
Of course you can use other tools like [GoLand](https://www.jetbrains.com/go/), [Vim](https://github.com/fatih/vim-go), [Emacs](https://github.com/dominikh/go-mode.el). However take notice that the Visual Studio Go extension is [officially supported](https://blog.golang.org/vscode-go) by the Go team.

### Local Machine

Follow these steps if you are OK installing and using Go on your machine.

1. Install [Go](https://golang.org/doc/install).
1. Install [Visual Studio Code](https://code.visualstudio.com/).
1. Install [Go extension](https://code.visualstudio.com/docs/languages/go).
1. Clone and open this repository.
1. `F1` -> `Go: Install/Update Tools` -> (select all) -> OK.

### Development Container

Follow these steps if you do not want to install Go on your machine and you prefer to use a Development Container instead.

1. Install [Visual Studio Code](https://code.visualstudio.com/).
1. Follow [Developing inside a Container - Getting Started](https://code.visualstudio.com/docs/remote/containers#_getting-started).
1. Clone and open this repository.
1. `F1` -> `Remote-Containers: Reopen in Container`.
1. `F1` -> `Go: Install/Update Tools` -> (select all) -> OK.

The Development Container configuration mixes [Docker in Docker](https://github.com/microsoft/vscode-dev-containers/tree/master/containers/docker-in-docker) and [Go](https://github.com/microsoft/vscode-dev-containers/tree/master/containers/go) definitions. Thanks to it you can use `go`, `docker`, `docker-compose` inside the container.

## Build

### Terminal

- `make` - execute the build pipeline.
- `make help` - print help for the [Make targets](Makefile).

### Visual Studio Code

`F1` → `Tasks: Run Build Task (Ctrl+Shift+B or ⇧⌘B)` to execute the build pipeline.

## Release

The release workflow is triggered each time a tag with `v` prefix is pushed.

_CAUTION_: Make sure to understand the consequences before you bump the major version. More info: [Go Wiki](https://github.com/golang/go/wiki/Modules#releasing-modules-v2-or-higher), [Go Blog](https://blog.golang.org/v2-go-modules).

## Maintainance

Remember to update Go version in [.github/workflows](.github/workflows), [Makefile](Makefile) and [devcontainer.json](.devcontainer/devcontainer.json).

Notable files:

- [devcontainer.json](.devcontainer/devcontainer.json) - Visual Studio Code Remote Container configuration,
- [.github/workflows](.github/workflows) - GitHub Actions workflows,
- [.github/dependabot.yml](.github/dependabot.yml) - Dependabot configuration,
- [.vscode](.vscode) - Visual Studio Code configuration files,
- [.golangci.yml](.golangci.yml) - golangci-lint configuration,
- [.goreleaser.yml](.goreleaser.yml) - GoReleaser configuration,
- [Dockerfile](Dockerfile) - Dockerfile used by GoReleaser to create a container image,
- [Makefile](Makefile) - Make targets used for development, [CI build](.github/workflows) and [.vscode/tasks.json](.vscode/tasks.json),
- [go.mod](go.mod) - [Go module definition](https://github.com/golang/go/wiki/Modules#gomod),
- [tools.go](tools.go) - [build tools](https://github.com/golang/go/wiki/Modules#how-can-i-track-tool-dependencies-for-a-module).

## FAQ

### Why Visual Studio Code editor configuration

Developers that use Visual Studio Code can take advantage of the editor configuration. While others do not have to care about it. Setting configs for each repo is unnecessary time consuming. VS Code is the most popular Go editor ([survey](https://blog.golang.org/survey2019-results)) and it is officially [supported by the Go team](https://blog.golang.org/vscode-go).

You can always remove the [.devcontainer](.devcontainer) and [.vscode](.vscode) directories if it really does not help you.

### Why GitHub Actions, not any other CI server

GitHub Actions is out-of-the-box if you are already using GitHub.
[Here](https://github.com/mvdan/github-actions-golang) you can learn how to use it for Go.

However, changing to any other CI server should be very simple, because this repository has build logic and tooling installation in [Makefile](Makefile).

### How can I build on Windows

Install [tdm-gcc](https://jmeubank.github.io/tdm-gcc/) and copy `C:\TDM-GCC-64\bin\mingw32-make.exe` to `C:\TDM-GCC-64\bin\make.exe`. Alternatively, you may install [mingw-w64](http://mingw-w64.org/doku.php) and copy `mingw32-make.exe` accordingly.

Alternatively use [WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or develop inside a [Remote Container](https://code.visualstudio.com/docs/remote/containers). However, take into consideration that then you are not going to use "bare-metal" Windows.

### How can I create an application installation script

1. Install [GoDownloader](https://github.com/goreleaser/godownloader).

1. Execute:

    ```bash
    godownloader --repo=your_org/repo_name > ./install.sh
    ```

1. Push `install.sh` to your repository.

1. Add installation instructions to your `README.md` e.g.:

    ```bash
    curl -sSfL https://raw.githubusercontent.com/your_org/repo_name/main/install.sh | sh -s -- -b /usr/local/bin
    ```

### How can I customize the release or add deb/rpm/snap packages, Homebrew Tap, Scoop App Manifest etc

Take a look at GoReleaser [docs](https://goreleaser.com/customization/) as well as [its repo](https://github.com/goreleaser/goreleaser/) how it is dogfooding its functionality.

### How can I create a library instead of an application

You can change the [.goreleaser.yml](.goreleaser.yml) to contain:

```yaml
build:
  skip: true
release:
  github:
  prerelease: auto
```

Alternatively, you can completly remove the usage of GoReleaser if you prefer handcrafted release notes. Take a look how it is done in [taskflow](https://github.com/pellared/taskflow).

### Why the code coverage results are not accurate

By default `go test` records code coverage for the package that is currently tested. If you want to get more accurate (cross-package) coverage, then consider using [go-acc](https://github.com/ory/go-acc). [Read more](https://www.ory.sh/golang-go-code-coverage-accurate/).

### How to automate generating git tags for next release version

Auto-tagging can be done in many ways e.g. by using GitHub Actions like:

- [Github Tag Bump](https://github.com/marketplace/actions/github-tag-bump),
- [bumpr](https://github.com/marketplace/actions/bumpr-bump-version-when-merging-pull-request-with-specific-labels),
- [Increment Semantic Version](https://github.com/marketplace/actions/increment-semantic-version),
- [Github Tag](https://github.com/marketplace/actions/github-tag).

However, creating a release tag manually is often the optimal approach. Take notice that this template executes a release workflow each time a git tag with `v` prefix is pushed.

## Contributing

Simply create an issue or a pull request.
