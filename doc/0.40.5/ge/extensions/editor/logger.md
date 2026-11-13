# `editor_logger`

*Fichier : `lua/ge/extensions/editor/logger.lua` · VM : Game Engine (GE) · 18 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_logger` : `extensions.load("editor_logger")`, puis la globale `editor_logger`

Extension d'éditeur vide (squelette). Elle déclare onEditorGui et onExtensionLoaded sans aucun code : aucune fenêtre ni aucun comportement n'est ajouté.

## Remarques

- Les deux fonctions du fichier sont des coquilles vides ; le fichier est chargé comme extension d'éditeur parce qu'il contient « M.onEditor ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_logger.onEditorGui()` | Hook appelé à chaque frame par l'éditeur pour dessiner l'interface. Corps vide ici. *(interne)* *(hook)* | 9 |
| `editor_logger.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Corps vide ici. *(interne)* *(hook)* | 12 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/logger.lua`.*
