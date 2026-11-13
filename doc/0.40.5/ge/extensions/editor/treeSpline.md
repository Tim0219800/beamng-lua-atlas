# `editor_treeSpline`

*Fichier : `lua/ge/extensions/editor/treeSpline.lua` · VM : Game Engine (GE) · 619 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_treeSpline` : `extensions.load("editor_treeSpline")`, puis la globale `editor_treeSpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_treeSpline.onClientEndMission()` | *(hook)* | 592 |
| `editor_treeSpline.onDeserialized(data)` | *(hook)* | 556 |
| `editor_treeSpline.onEditorBeforeSaveLevel()` | Only locked splines' trees are the level's. The live ones go back on the next frame, after every save hook has run. *(hook)* | 598 |
| `editor_treeSpline.onEditorGui()` | *(hook)* | 504 |
| `editor_treeSpline.onEditorInitialized()` | *(hook)* | 579 |
| `editor_treeSpline.onSerialize()` | Serialise: snapshot the spline definitions, then remove the planted instances so no orphans survive the Lua<br> VM reload; onDeserialized re-plants them. A locked spline's trees (and any hand edits) stay in the forest instead: it carries<br> their keys across and takes them back. *(hook)* | 546 |
| `editor_treeSpline.setLockedById(id, isLocked)` | Locks/unlocks the tree spline with this id and re-plants it now (also used by the Master Spline for linked children). A<br> locked spline's trees are left in the forest when the level saves (see onEditorBeforeSaveLevel). | 118 |
| `editor_treeSpline.setSelectedNodeIdx(idx)` |  | 99 |
| `editor_treeSpline.setSelectedSplineIdx(idx)` | Cross-tool selection setters (invoked by splineInput when a jump into this tool occurs). Both must exist or<br> splineInput skips the selection entirely (it requires the pair). | 98 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/treeSpline.lua`.*
