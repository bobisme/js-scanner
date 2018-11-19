#!/bin/sh

set -euxo pipefail

eslint --config /config/eslintrc --no-eslintrc . "$@"
yarn audit
