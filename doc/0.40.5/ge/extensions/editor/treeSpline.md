# `editor_treeSpline`

*File: `lua/ge/extensions/editor/treeSpline.lua` · VM: Game Engine (GE) · 619 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_treeSpline`: `extensions.load("editor_treeSpline")`, then the global `editor_treeSpline`

Editor Tree Spline tool: you draw an editable polyline on the terrain and the tool plants a regular row of trees/shrubs (real Forest instances) along it (avenues, hedges). From 2 nodes, the spline plants and replants live when you add/move/delete nodes or change the distribution. "Line" sibling of forestZoneEditor; shares the core of toolUtilities/foliageScatter. Same structure as meshSpline/assemblySpline (editor/<tool>.lua + <tool>/splineMgr.lua + populate.lua). "treeSpline" window and treeSplineEditMode edit mode.

## Notes

- Constants: spacing 0.5 to 40 m, position variance 0 to 1, scale variance 0 to 0.9, max slope 0 to 89°, max seed 100000, RDP simplification tolerance 4 m.
- A locked spline (isEnabled = false) keeps its trees in the forest when the level is saved and on serialization; only active splines are removed/lifted.
- setSelectedSplineIdx and setSelectedNodeIdx must exist as a pair, otherwise splineInput ignores the cross-tool selection.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_treeSpline.onClientEndMission()` | End-of-mission hook: forgets the lifted trees and deletes all splines. *(internal)* *(hook)* | 592 |
| `editor_treeSpline.onDeserialized(data)` | After reload: restores the state (splines marked dirty, replanted at the next onEditorGui). *(internal)* *(hook)* | 556 |
| `editor_treeSpline.onEditorBeforeSaveLevel()` | Before the level is saved: lifts from the forest (scatter.lift) the trees of active splines so they are not written; only the trees of locked splines are part of the level. They are put back on the next frame. *(internal)* *(hook)* | 598 |
| `editor_treeSpline.onEditorGui()` | Editor frame hook: puts back the lifted trees, replants dirty splines (even when the tool is inactive), draws the window, handles node editing via splineInput and the rendering of splines. *(internal)* *(hook)* | 504 |
| `editor_treeSpline.onEditorInitialized()` | Editor initialization hook: creates editor.editModes.treeSplineEditMode and registers the treeSpline window (330x760). *(internal)* *(hook)* | 579 |
| `editor_treeSpline.onSerialize()` | Before the Lua VM reload: for each locked spline, keeps the keys of its trees (keptObjects via populate.release), then takes a snapshot of the definitions and removes the planted instances to avoid orphans. onDeserialized replants them. *(internal)* *(hook)* | 546 |
| `editor_treeSpline.setLockedById(id, isLocked)` | Locks/unlocks the tree spline with the given identifier (isEnabled = not isLocked), marks it dirty and replants it immediately. Also used by the Master Spline for linked children. The trees of a locked spline stay in the forest on save. No effect if the id is unknown. | 118 |
| `editor_treeSpline.setSelectedNodeIdx(idx)` | Sets the index of the selected node; called by splineInput on a jump to this tool. *(internal)* | 99 |
| `editor_treeSpline.setSelectedSplineIdx(idx)` | Sets the index of the selected spline; called by splineInput on a jump to this tool. *(internal)* | 98 |

### Parameter details

#### `editor_treeSpline.onDeserialized(data)`

After reload: restores the state (splines marked dirty, replanted at the next onEditorGui).

- `data` (*table|nil*) : Value returned by onSerialize.

#### `editor_treeSpline.onSerialize()`

Before the Lua VM reload: for each locked spline, keeps the keys of its trees (keptObjects via populate.release), then takes a snapshot of the definitions and removes the planted instances to avoid orphans. onDeserialized replants them.

- **returns**: table State of the splines (splineMgr.getState()).

#### `editor_treeSpline.setLockedById(id, isLocked)`

Locks/unlocks the tree spline with the given identifier (isEnabled = not isLocked), marks it dirty and replants it immediately. Also used by the Master Spline for linked children. The trees of a locked spline stay in the forest on save. No effect if the id is unknown.

- `id` (*string*) : Spline identifier.
- `isLocked` (*boolean*) : True to lock.

#### `editor_treeSpline.setSelectedNodeIdx(idx)`

Sets the index of the selected node; called by splineInput on a jump to this tool.

- `idx` (*integer*) : Node index (1-based).

#### `editor_treeSpline.setSelectedSplineIdx(idx)`

Sets the index of the selected spline; called by splineInput on a jump to this tool.

- `idx` (*integer*) : Spline index (1-based).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/treeSpline.lua`.*
