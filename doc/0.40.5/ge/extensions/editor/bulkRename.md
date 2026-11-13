# `editor_bulkRename`

*Fichier : `lua/ge/extensions/editor/bulkRename.lua` · VM : Game Engine (GE) · 269 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_bulkRename` : `extensions.load("editor_bulkRename")`, puis la globale `editor_bulkRename`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_bulkRename.onEditorActivated()` | *(hook)* | 245 |
| `editor_bulkRename.onEditorGui()` | *(hook)* | 139 |
| `editor_bulkRename.onEditorInitialized()` | *(hook)* | 256 |
| `editor_bulkRename.onEditorObjectSelectionChanged()` | *(hook)* | 248 |
| `editor_bulkRename.onExtensionLoaded()` | *(hook)* | 261 |

## Appels vers le moteur (C++)

- `Sim.` `findObjectsByNameMask`
- `obj:` `getGeneratedDisplayName`, `getID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/bulkRename.lua`.*
