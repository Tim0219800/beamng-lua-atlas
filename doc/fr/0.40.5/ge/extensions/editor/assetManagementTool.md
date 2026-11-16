# `editor_assetManagementTool`

*Fichier : `lua/ge/extensions/editor/assetManagementTool.lua` · VM : Game Engine (GE) · 2025 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assetManagementTool` : `extensions.load("editor_assetManagementTool")`, puis la globale `editor_assetManagementTool`

Outil d'éditeur « Asset Management Tool » (menu Window > Assets, fenêtre 1200x900) destiné à la gestion des fichiers assets et des fichiers lien (link files, pour le dépôt SVN de BeamNG). Onglets : Duplicated Assets (visible seulement en devMode), Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker. Il s'appuie sur FS:hashFile, FS:findLinkFiles, FS:convertLinkFileToTargetCopy, FS:copyFile, etc. Outil interne de développement, peu utile à un mod.

## Remarques

- L'onglet Duplicated Assets exige devMode et que le userpath soit identique au chemin du jeu (option de ligne de commande -nouserpath), sinon il affiche un avertissement.
- Seuls onEditorInitialized, onEditorActivated, onEditorGui et onExtensionLoaded sont exportés ; la fonction onWindowMenuItem reste locale (utilisée par le menu).
- Les dossiers de données de jeu considérés sont /art, /core, /campaigns, /levels, /protected, /vehicles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assetManagementTool.onEditorActivated()` | Hook appelé à l'activation de l'éditeur ; corps vide. *(interne)* *(hook)* | 1989 |
| `editor_assetManagementTool.onEditorGui()` | Hook appelé à chaque frame de l'éditeur : dessine la fenêtre à onglets (Duplicated Assets si devMode, Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker) et les dialogues modaux associés (ex. confirmation de retrait d'assets de la liste). *(interne)* *(hook)* | 1639 |
| `editor_assetManagementTool.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre 'assetManagementTool' et ses ~15 fenêtres modales, ajoute l'entrée de menu « Asset Management Tool » (groupe Assets) et charge la liste de doublons sauvegardée (loadDuplicatesList). *(interne)* *(hook)* | 1996 |
| `editor_assetManagementTool.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; corps vide. *(interne)* *(hook)* | 2017 |

## Appels vers le moteur (C++)

- `FS:` `convertLinkFileToTargetCopy`, `copyFile`, `deleteAssetFileForLinkFile`, `fileExists`, `findFiles`, `findHighestNumberedFolder`, `findLinkFiles`, `getGamePath`, `getHashFileAlgorithmId`, `getUserPath`, `hashFile`, `isLinkFile`, `native2Virtual`, `removeFile`
- `worldEditorCppApi.` `isSelectMultipleFilesAvailable`, `selectMultipleFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assetManagementTool.lua`.*
