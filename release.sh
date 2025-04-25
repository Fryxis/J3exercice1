#!/bin/bash

set -e

TOOL=${1:-standard-version}

run_tests() {
  echo "▶ Lancement des tests..."
  npm test || { echo "❌ Tests échoués. Release annulée."; exit 1; }
}

case "$TOOL" in
  standard-version)
    echo "🚀 Release avec standard-version"
    run_tests

    # Génère changelog, incrémente version et crée le tag
    npx standard-version

    # Commit du changelog généré
    git add CHANGELOG.md
    git commit -m "docs(changelog): update for version $(git describe --tags)" || echo "ℹ️ Aucun changement à committer dans le changelog"

    # Push des commits et tags
    git push origin main
    git push origin --tags

    # Crée une release GitHub avec le changelog généré
    gh release create "$(git describe --tags)" --title "$(git describe --tags)" --notes "$(npx conventional-changelog -p angular -r 1)"
    ;;

  release-it)
    echo "🚀 Release avec release-it"
    run_tests
    npx release-it
    ;;

  semantic-release)
    echo "🚀 Release avec semantic-release (via CI uniquement)"
    echo "ℹ️ Ce mode est prévu pour GitHub Actions ou GitLab CI. Aucune action locale."
    ;;

  *)
    echo "❌ Outil inconnu : $TOOL"
    echo "Utilisation : ./release.sh [standard-version|release-it|semantic-release]"
    exit 1
    ;;
esac
