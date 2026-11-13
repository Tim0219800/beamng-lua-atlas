# `editor_meshSpline`

*Fichier : `lua/ge/extensions/editor/meshSpline.lua` · VM : Game Engine (GE) · 1924 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline` : `extensions.load("editor_meshSpline")`, puis la globale `editor_meshSpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline.eachObjectById(id, fn)` | The splineLock `each` for the mesh spline with this id (nothing if it is gone). | 108 |
| `editor_meshSpline.onClientEndMission()` | Called when leaving the map. Removes all mesh splines. *(hook)* | 1907 |
| `editor_meshSpline.onDeserialized(data)` | Deserialise callback. *(hook)* | 164 |
| `editor_meshSpline.onEditorGui()` | World editor main callback. *(hook)* | 1782 |
| `editor_meshSpline.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 1886 |
| `editor_meshSpline.onSerialize()` | Serialise callback. *(hook)* | 141 |
| `editor_meshSpline.setLockedById(id, isLocked)` | Locks/unlocks the mesh spline with this id and rebuilds it now (also used by the Master Spline for linked children). | 98 |
| `editor_meshSpline.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 138 |
| `editor_meshSpline.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 135 |

## Appels vers le moteur (C++)

- `obj:` `getClassName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline.lua`.*
