# `editor_resourceChecker`

*Fichier : `lua/ge/extensions/editor/resourceChecker.lua` · VM : Game Engine (GE) · 1841 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_resourceChecker` : `extensions.load("editor_resourceChecker")`, puis la globale `editor_resourceChecker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_resourceChecker.jobData(type, data)` |  | 1805 |
| `editor_resourceChecker.onEditorActivated()` | *(hook)* | 1818 |
| `editor_resourceChecker.onEditorDeactivated()` | *(hook)* | 1822 |
| `editor_resourceChecker.onEditorGui()` | *(hook)* | 1778 |
| `editor_resourceChecker.onEditorInitialized()` | *(hook)* | 1826 |
| `editor_resourceChecker.onWindowMenuItem()` | *(hook)* | 17 |
| `editor_resourceChecker.updateDuplicateTable(data)` |  | 1814 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `stat`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/resourceChecker.lua`.*
