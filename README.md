# 📚 Exercices CI/CD – Gestion des versions

Ce dépôt contient les exercices 1 et 2 du module CI/CD sur la gestion des versions et la publication avec Git. Ces exercices visent à comprendre l'importance de la documentation des changements et du versionnement d'un projet.

---

## ✅ Exercice 1 – Création d’un CHANGELOG.md

### 🎯 Objectif
Créer un fichier `CHANGELOG.md` qui résume les changements récents apportés au projet, en se basant sur les 5 derniers commits.

### 🧠 Intérêt pédagogique
- Comprendre l'utilité d'un changelog pour documenter les évolutions du projet.
- Adopter un format standard (Keep a Changelog).
- Faciliter la lecture et le suivi du projet pour les autres développeurs et utilisateurs.

### 🛠 Commandes à exécuter

```bash
# Récupérer les 5 derniers commits
git log -n 5 --pretty=format:"%h %s"
```
# Créer le fichier CHANGELOG.md et y écrire manuellement :
```bash
vim CHANGELOG.md
```
# 📝 Exemple de contenu du fichier

# Changelog

## [1.0.0] - 2025-04-24

### Added
- Ajout du fichier `document1`
- Ajout du fichier `document2`
- Ajout du fichier `document3`
- Ajout du fichier `document4`
- Ajout du fichier `document5`

# Ajouter et commit le changelog
```bash
git add CHANGELOG.md
git commit -m "docs(changelog): ajout du changelog version 1.0.0"
git push
```

# 🏷️ Exercice 2 – Tagging & Publication d'une version

---

## 🎯 Objectif

Créer un **tag Git** pour marquer une version stable du projet (`v1.0.0`), le **pousser sur GitHub**, et **publier une release** visible sur l’interface web.

---

## 🧠 Pourquoi c’est important

- ✅ Marquer des versions **stables** du code source (livraisons, milestones, releases).
- 🔁 Pouvoir **revenir** facilement à un état du code (`git checkout v1.0.0`).
- 🔧 Utilisé dans les outils CI/CD, les déploiements automatisés, ou la génération de changelogs.
- 🧾 Permet de **publier** officiellement une version sur GitHub (avec changelog et fichiers associés).

---

## 📦 Étapes techniques

### 1. Créer un tag Git `v1.0.0`

```bash
git tag -a v1.0.0 -m "Version 1.0.0 - ajout des documents 1 à 5"
```

### 2. Pousser le tag sur le dépôt distant (GitHub)

```bash
git push origin v1.0.0
```
Cela rend le tag visible à tous (collaborateurs, outils CI/CD, GitHub Releases, etc.).

### 3. Créer la release GitHub (si ce n’est pas automatique)

- Aller sur GitHub : https://github.com/TON-UTILISATEUR/TON-REPO/releases
- Cliquer sur "Draft a new release"
- Sélectionner le tag v1.0.0
- Donner un titre : Version 1.0.0
- Coller le contenu de CHANGELOG.md dans la description
- Optionnel : ajouter un .zip, .tar.gz, ou binaire de ton projet
- Cliquer sur "Publish release" 
