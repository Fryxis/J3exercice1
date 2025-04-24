#!/bin/bash

set -e

TOOL=${1:-standard-version}

run_tests() {
  echo "▶ Lancement des tests..."
  npm test || { echo "❌ Tests échoués. Release annulée."; exit 1; }
}

case "$TOOL" in
  standard-version)
    run_tests
    npx standard-version
    git push --follow-tags origin main
    gh release create "$(git describe --tags)" --notes "$(npx conventional-changelog -p angular -r 1)"
    ;;
  release-it)
    run_tests
    npx release-it
    ;;
  semantic-release)
    echo "▶ Lancement de semantic-release (via CI uniquement)"
    ;;
  *)
    echo "❌ Outil inconnu : $TOOL"
    exit 1
    ;;
esac
