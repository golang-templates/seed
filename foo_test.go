package library_test

import (
	"testing"

	. "github.com/golang-templates/library"
)

func TestFoo(t *testing.T) {
	want := "Bar"
	if got := Foo(); got != want {
		t.Errorf("Foo() = %v, want %v", got, want)
	}
}
