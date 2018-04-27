#!/bin/bash -euxv

set -o pipefail

travis_fold() {
  local action=$1
  local name=$2
  echo -en "travis_fold:${action}:${name}\\r"
}

for i in Formula/*.rb; do
  formula_name="$(basename "$i" .rb)"
  travis_fold start "$formula_name"
  # uninstall first in case it's been installed as a dep already.
  brew uninstall "$formula_name" || true
  brew install -v "$formula_name"
  brew test "$formula_name"
  brew uninstall "$formula_name"
  travis_fold end "$formula_name"
done
