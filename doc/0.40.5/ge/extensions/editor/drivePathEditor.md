# `editor_drivePathEditor`

*Fichier : `lua/ge/extensions/editor/drivePathEditor.lua` · VM : Game Engine (GE) · 1248 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor` : `extensions.load("editor_drivePathEditor")`, puis la globale `editor_drivePathEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor.onClientEndMission()` | Called once when leaving the map. We need to remove all drive path splines. *(hook)* | 1231 |
| `editor_drivePathEditor.onDeserialized(data)` | Deserialise callback. *(hook)* | 99 |
| `editor_drivePathEditor.onEditorGui()` | World editor main callback. *(hook)* | 1087 |
| `editor_drivePathEditor.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 1217 |
| `editor_drivePathEditor.onSerialize()` | Serialise callback. *(hook)* | 86 |
| `editor_drivePathEditor.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 83 |
| `editor_drivePathEditor.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 80 |

## Appels vers le moteur (C++)

- `be:` `enterVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor.lua`.*
