//+build mage

package main

import (
	"github.com/magefile/mage/mg"
	"github.com/magefile/mage/sh"
)

// All full build: build, lint, test.
func All() {
	mg.SerialDeps(Build, Lint, Test)
}

// Build go build.
func Build() error {
	return sh.RunV("go", "build", "./...")
}

// Lint golangci-lint.
func Lint() error {
	return sh.RunV("golangci-lint", "run")
}

// Test go test with race detector and code covarage.
func Test() error {
	return sh.RunV("go", "test", "-race", "-covermode=atomic")
}
