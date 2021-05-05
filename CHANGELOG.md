# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/golang-templates/seed/compare/v0.15.0...HEAD)

## [0.15.0](https://github.com/golang-templates/seed/releases/tag/v0.15.0)

### Added 

- Add [CHANGELOG.md](CHANGELOG.md) based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). ([#131](https://github.com/golang-templates/seed/pull/131))
- Add [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) based on [Contributor Covenant](https://www.contributor-covenant.org/version/2/0/code_of_conduct/). ([#133](https://github.com/golang-templates/seed/pull/133))

### Changed

- Refine the triggers for the `build` GitHub workflow. ([#130](https://github.com/golang-templates/seed/pull/130))
  - Automatic trigger for the `main` branch.
  - Automatic trigger for pull requests targeting the `main` branch.
  - Manual trigger via [`workflow_dispatch`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#workflow_dispatch) ([blog post](https://github.blog/changelog/2020-07-06-github-actions-manual-triggers-with-workflow_dispatch/)).
- Lock the runners' version the in `build` and `release` GitHub workflows. ([#130](https://github.com/golang-templates/seed/pull/130))
- Configure `golint` linter with `min-confidence: 0.8` to avoid [false positive "should have a package comment"](https://github.com/golangci/golangci-lint/issues/1556). ([#132](https://github.com/golang-templates/seed/pull/132))
- Configure `gocyclo` linter with `min-complexity: 15` with is a recommeded value by [Go Report Card](https://goreportcard.com/). ([#132](https://github.com/golang-templates/seed/pull/132))
- Update [GoReleaser](https://github.com/goreleaser/goreleaser) to [0.164.0](https://github.com/goreleaser/goreleaser/releases/tag/v0.164.0). ([#129](https://github.com/golang-templates/seed/pull/129))

## [0.14.0](https://github.com/golang-templates/seed/releases/tag/v0.14.0)

### Added

- Build and push a Docker container image. ([#127](https://github.com/golang-templates/seed/pull/127))

### Changed

- Move the `main` package to the root directory. ([#127](https://github.com/golang-templates/seed/pull/127))
  - It is suggested to use the `cmd` structure if the repository builds more than one application.
- Update [.golangci.yml](https://github.com/golang-templates/seed/blob/v0.14.0/.golangci.yml). ([#127](https://github.com/golang-templates/seed/pull/127))
- Update [GoReleaser](https://github.com/goreleaser/goreleaser) to [0.162.0](https://github.com/goreleaser/goreleaser/releases/tag/v0.162.0). ([#126](https://github.com/golang-templates/seed/pull/126))
- Update [golangci-lint](https://github.com/golangci/golangci-lint) to [1.39.0](https://github.com/golangci/golangci-lint/releases/tag/v1.39.0). ([#125](https://github.com/golang-templates/seed/pull/125))
