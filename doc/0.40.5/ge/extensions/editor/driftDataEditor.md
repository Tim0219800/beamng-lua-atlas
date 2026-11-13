# `editor_driftDataEditor`

*Fichier : `lua/ge/extensions/editor/driftDataEditor.lua` · VM : Game Engine (GE) · 864 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_driftDataEditor` : `extensions.load("editor_driftDataEditor")`, puis la globale `editor_driftDataEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_driftDataEditor.clearStuntZonesEditor()` |  | 171 |
| `editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr)` | helper function | 795 |
| `editor_driftDataEditor.drawElementDetail(elem)` |  | 58 |
| `editor_driftDataEditor.onDeserialized(data)` | *(hook)* | 749 |
| `editor_driftDataEditor.onEditorGui()` | *(hook)* | 699 |
| `editor_driftDataEditor.onEditorInitialized()` | *(hook)* | 731 |
| `editor_driftDataEditor.onSerialize()` | *(hook)* | 739 |
| `editor_driftDataEditor.selectStuntZone(index)` | INTERNAL | 113 |
| `editor_driftDataEditor.show()` |  | 726 |
| `editor_driftDataEditor.updateMouseInfo()` |  | 759 |

## Appels vers le moteur (C++)

- `FS:` `remove`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `getPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/driftDataEditor.lua`.*
