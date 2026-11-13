# `editor_toolUtilities_materialSelectionMgr`

*Fichier : `lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_materialSelectionMgr` : `extensions.load("editor_toolUtilities_materialSelectionMgr")`, puis la globale `editor_toolUtilities_materialSelectionMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_materialSelectionMgr.closeWindow()` | Closes the material selection window. | 63 |
| `editor_toolUtilities_materialSelectionMgr.getTexObj(absPath)` | Gets the texture object for a given absolute path. | 43 |
| `editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct)` | Handles the material selection window. | 66 |
| `editor_toolUtilities_materialSelectionMgr.openWindow()` | Opens the material selection window. | 60 |
| `editor_toolUtilities_materialSelectionMgr.registerWindow()` | Registers the material selection window. | 57 |

## Appels vers le moteur (C++)

- `Sim.` `getMaterialSet`
- `obj:` `getField`, `getName`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua`.*
