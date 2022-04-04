#!/usr/bin/sh

TEST_RUNNER="bin/rkt-test.sh"

if [ ! "$1" ]; then
    echo "[ERROR]: Please provide the Homework directory name." >&2
    exit 128
fi

MAKEFILE=$(cat << MAKEFILE_END
.PHONY: build test clean

MAIN_FILE=$1.m4

build:
	mkdir -p build
	m4 \${MAIN_FILE} > build/$1.rkt

test: build
	$(realpath ${TEST_RUNNER}) build/$1.rkt

clean:
	rm -r build
MAKEFILE_END
)

MAIN_FILE=$(cat << MAIN_FILE_END
#lang plai

include(../suplib/principles.rkt)
include(src/solution.rkt)
include(../suplib/test-fw.rkt)
include(test/tests.rkt)

MAIN_FILE_END
)

SOLUTION_BOILER=$(cat << SOLUTION_BOILER_END
; This is your solution file. You can do your solution here.

SOLUTION_BOILER_END
)

TEST_BOILER=$(cat << TEST_BOILER_END
; This is your test file. Write your test-cases here.

TEST_BOILER_END
)

# Create the make file and the m4.
mkdir -p "$1"
echo "${MAKEFILE}" > "$1/Makefile"
echo "${MAIN_FILE}" > "$1/$1.m4"

# Create the source directory
mkdir -p "$1/src"
echo "${SOLUTION_BOILER}" > "$1/src/solution.rkt"

# Create the test directory
mkdir -p "$1/test"
echo "${TEST_BOILER}" > "$1/test/tests.rkt"
