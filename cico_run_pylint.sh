#!/bin/bash

set -ex

check_python_version() {
    python3 tools/check_python_version.py 3 6
}

# this script is copied by CI, we don't need it
rm -f env-toolkit

. cico_setup.sh
check_python_version
./detect-common-errors.sh
./detect-dead-code.sh
./measure-cyclomatic-complexity.sh --fail-on-error
./measure-maintainability-index.sh --fail-on-error
./run-linter.sh
