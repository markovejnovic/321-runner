#!/usr/bin/env bash

SEP_STR="----------------------------------------"
SEP_STR_TOP="========================================"

function section_begin {
    echo "$SEP_STR_TOP"
    echo "$1"
    echo "$SEP_STR"
}

function section_end {
    echo "$SEP_STR_TOP"
    echo
}

section_begin "Running Tests"
test_run=$(racket $1 2>&1)
echo "Finished running tests in $1."
section_end

section_begin "Successful Tests"
echo "$(echo "$test_run" | grep good | wc -l) tests passed."
section_end

section_begin "Failed Tests"
failed=$(echo "$test_run" | grep bad -a2)
failed_count=$(echo -n "$failed" | grep bad | wc -l)
echo "$failed_count tests failed."

if [[ "$failed_count" != "0" ]]; then
    echo "$failed"
fi
section_end

section_begin "Errors"
ex=$(echo -n "$test_run" | grep exception -a2)
err_count=$(echo -n "$ex" | grep exception | wc -l)
echo "$err_count erroneous tests."

if [[ "$err_count" != "0" ]]; then
    echo "$(echo -n "$ex")"
fi
section_end

section_begin "Other"
no_gbex=$(echo -n "$test_run" | sed -e '/good/,+3d' | sed -e '/bad/,+3d' \
          | sed -e '/exception/,+3d')
other_count=$(echo -n "$no_gbex" | wc -l)

echo "$other_count other messages."
if [[ "$other_count" != "0" ]]; then
    echo "$no_gbex"
fi
section_end
