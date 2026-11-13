# `editor_assemblySpline`

*Fichier : `lua/ge/extensions/editor/assemblySpline.lua` · VM : Game Engine (GE) · 1787 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline` : `extensions.load("editor_assemblySpline")`, puis la globale `editor_assemblySpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline.eachObjectById(id, fn)` | The splineLock `each` for the assembly spline with this id (nothing if it is gone). | 109 |
| `editor_assemblySpline.onClientEndMission()` | Called when leaving the map. *(hook)* | 1768 |
| `editor_assemblySpline.onDeserialized(data)` | Deserialise callback. *(hook)* | 161 |
| `editor_assemblySpline.onEditorGui()` | World editor main callback. *(hook)* | 1646 |
| `editor_assemblySpline.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 1748 |
| `editor_assemblySpline.onSerialize()` | Serialise callback. *(hook)* | 142 |
| `editor_assemblySpline.setLockedById(id, isLocked)` | Locks/unlocks the assembly spline with this id and rebuilds it now (also used by the Master Spline for linked children). | 99 |
| `editor_assemblySpline.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 139 |
| `editor_assemblySpline.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 136 |

## Appels vers le moteur (C++)

- `obj:` `getClassName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline.lua`.*
