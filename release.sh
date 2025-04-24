#!/bin/bash
set -e

TOOL=${1:-standard-version}
INFO_FILE="RELEASE_INFO.txt"

run_tests() {
  echo "▶ Lancement des tests..."
  npm test || { echo "❌ Tests échoués. Release annulée."; exit 1; }
}

load_release_info() {
  if [[ ! -f "$INFO_FILE" ]]; then
    echo "❌ Fichier $INFO_FILE manquant."
    exit 1
  fi
  source "$INFO_FILE"
  if [[ -z "$TAG" || -z "$NAME" || -z "$NOTES" ]]; then
    echo "❌ Fichier $INFO_FILE incomplet. TAG, NAME et NOTES sont requis."
    exit 1
  fi
}

case "$TOOL" in
  standard-version)
    load_release_info
    run_tests
    npx standard-version --release-as "$TAG"
    git push --follow-tags origin main
    gh release create "$TAG" --title "$NAME" --notes "$NOTES"
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

