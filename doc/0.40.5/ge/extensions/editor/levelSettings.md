# `editor_levelSettings`

*Fichier : `lua/ge/extensions/editor/levelSettings.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_levelSettings` : `extensions.load("editor_levelSettings")`, puis la globale `editor_levelSettings`

Extension d'éditeur minimale : enregistre un gestionnaire d'inspecteur pour le type de sélection « level_settings » (qui n'affiche que le texte « Level Settings ») et ajoute editor.showLevelSettings() pour sélectionner ce pseudo-objet.

## Exemple

```lua
editor.showLevelSettings() -- ouvre dans l'inspecteur le panneau « Level Settings »
```

## Remarques

- Le panneau ne contient qu'un texte : aucun réglage n'est réellement exposé par ce fichier.
- showLevelSettings remplace editor.selection par une table vide puis met editor.selection.level_settings = {1}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_levelSettings.onEditorActivated()` | Appelé à l'activation de l'éditeur : enregistre le type d'inspecteur « level_settings » et définit editor.showLevelSettings. *(interne)* *(hook)* | 21 |
| `editor_levelSettings.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur : retire le type d'inspecteur « level_settings ». *(interne)* *(hook)* | 26 |
| `editor_levelSettings.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Corps vide. *(interne)* *(hook)* | 13 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/levelSettings.lua`.*
