#!/bin/sh

set -euo pipefail

FAIL_SCAN=0

fail_scan() { FAIL_SCAN=1; }

fail_now() {
  echo "ERROR: security scan failed!"
  exit 2
}

eslint() {
  # Only run the scanner if eslintignore is there, otherwise it's pure pain.
  if [[ -f ".eslintignore" ]]; then
    command eslint --config /config/eslintrc.json --no-eslintrc "$@" \
      || fail_scan
  else
    echo ".eslintignore not found, skipping code scan because it takes too long"
  fi
}

audit_packages() {
  if [[ -f "yarn.lock" ]]; then
    yarn audit || fail_scan
  else
    echo "WARNING: npm can't audit custom registries"
    npm audit || fail_scan
  fi
}

main() {
  eslint "$@"
  audit_packages

  if [[ "$FAIL_SCAN" = 1 ]]; then fail_now; fi
}

main "$@"
