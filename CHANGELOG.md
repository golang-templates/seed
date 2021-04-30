# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/golang-templates/seed/compare/v0.14.0...HEAD)

### Added 

- Add [CHANGELOG.md](CHANGELOG.md) based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). ([#131](https://github.com/golang-templates/seed/pull/131))

### Changed

- Refine the triggers for the `build` GitHub workflow. ([#130](https://github.com/golang-templates/seed/pull/130))
  - Automatic trigger for the `main` branch.
  - Automatic trigger for pull requests targeting the `main` branch.
  - Manual trigger via [`workflow_dispatch`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#workflow_dispatch) ([blog post](https://github.blog/changelog/2020-07-06-github-actions-manual-triggers-with-workflow_dispatch/)).
- Lock the runners' version in `build` and `release` GitHub workflows. ([#130](https://github.com/golang-templates/seed/pull/130))

## [0.14.0](https://github.com/golang-templates/seed/releases/tag/v0.14.0)

### Added

- Build and push a Docker container image. ([#127](https://github.com/golang-templates/seed/pull/127))

### Changed

- Move `main` package to the root directory. ([#127](https://github.com/golang-templates/seed/pull/127))
  - It is suggested to use the `cmd` structure if the repository builds more than one application.
- Update [.golangci.yml](https://github.com/golang-templates/seed/blob/v0.14.0/.golangci.yml). ([#127](https://github.com/golang-templates/seed/pull/127))
- Bump [GoReleaser](github.com/goreleaser/goreleaser) to [0.162.0](https://github.com/goreleaser/goreleaser/releases/tag/v0.162.0). ([#126](https://github.com/golang-templates/seed/pull/126))
- Update [golangci-lint](github.com/golangci/golangci-lint) to [1.39.0](https://github.com/golangci/golangci-lint/releases/tag/v1.39.0). ([#125](https://github.com/golang-templates/seed/pull/125))
