# Homework Runner

## What is this?

Homework Runner is an incredibly simple set of shell scripts that you can use
to make your life easier when writing homework code.

The core idea behind this set of scripts is that you can use them to create
fast and easy boilerplate.

`m4` is used to merge multiple files together and, possibly, do other
preprocessing (up to you).

## Features

* Split your work in multiple files and then merge it all with `make build`
    into a single `.rkt` file (useful for submission).
* Make tests painless with a simple test runner.

## Requirements and how to get them

- `make`
- `m4`:
	- (Ubuntu/Debian): `sudo dnf install m4`
	- (Fedora): `sudo apt install m4`
	- (Pacman): `sudo pacman -S m4`
	- (MacOS): `brew install m4`
- POSIX Shell:
	- (*NIX systems): You already have it!
	- (Windows): Sorry, I don't really know.

## Getting Started

To get started, please simply clone this repo:
```sh
git clone https://github.com/markovejnovic/321-runner
cd 321-runner
```
Then, you can create a new homework with:
```sh
./init.sh Homework1
```

This will automatically create a folder structure inside `321-runner` of the
form:

```
321-runner/
├─ Homework1/
│  ├─ Makefile
│  ├─ src/
│  │  ├─ solution.rkt
│  ├─ test/
│  │  ├─ tests.rkt
│  ├─ Homework1.m4
```

Then, you can `cd` into `Homework1` and run `make`. This will automatically
build your solution from pieces into a file called
`Homework1/build/Homework1.rkt`:
```sh
cd Homework1
make build
```

If you wish to test, you can run `make test`. This will make use of the test
runner described in this document.

## Testing benefits

Some of the beauty in this is that I provide a small test-runner for you and a
very small test-framework. You can use this instead of the regular

```scheme
(test expected actual)
```

statements to make assertions easier and faster.

### Test Runner

The test runner (invokable with `make test`) will collect all your test
assertions and instead of outputting `good` for 40 of your test cases
filling your terminal up with nonsense you don't care about, the runner will
mangle it up and clean it up for you. It will, of course, preserve when test
cases fail (unless I made a bug somewhere :)).

### Testing Framework Docs

#### `test-true`

Example:
```scheme
(test-true (= 2 (+ 1 1))
```

#### `test-false`

Example:
```scheme
(test-false (= 2 (+ 1 0))
```
