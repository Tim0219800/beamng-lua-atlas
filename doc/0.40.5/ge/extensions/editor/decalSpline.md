# `editor_decalSpline`

*File: `lua/ge/extensions/editor/decalSpline.lua` · VM: Game Engine (GE) · 1764 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_decalSpline`: `extensions.load("editor_decalSpline")`, then the global `editor_decalSpline`

World Editor "Decal Spline" tool: you draw a spline (nodes, default width 10 m) along which decals are placed automatically from up to 4 components (material, texture rows/columns, frame, spacing, jitter). The file is the entry point of the tool ("decalSpline" window, "Decal Spline" edit mode); the logic is split between editor/decalSpline/splineMgr, editor/decalSpline/populate and the editor/toolUtilities utilities (splineInput, render/spline, session, bake, panCamera, materialSelectionMgr...). It also handles saving the splines in the level (onSerialize/onDeserialized, which survives Lua reload) and session import/export.

## Notes

- Even outside the edit mode, onEditorGui rebuilds the modified splines (to update linked splines) and draws their outlines (shells).
- A locked spline (isEnabled = false) keeps its decals in the scene; onSerialize releases them via populate.release and onDeserialized takes them back via populate.adopt.
- onSerialize deletes all splines after serializing them (splineMgr.removeAllDecalSplines(true)): the splines are recreated by onDeserialized.
- Internal constants: RDP simplification tolerance 9.0, spacing between 0 and 100, elevation line scale 100.
- setSelectedSplineIdx and setSelectedNodeIdx have no bounds check (the bound is only applied in onDeserialized).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_decalSpline.onClientEndMission()` | Hook called when leaving the map; deletes all decal splines. *(internal)* *(hook)* | 1745 |
| `editor_decalSpline.onDeserialized(data)` | Restore hook after Lua reload: recreates the splines from the serialized data, takes back the decals kept from locked splines (populate.adopt), clamps the selected index and recomputes the id to index table. *(internal)* *(hook)* | 127 |
| `editor_decalSpline.onEditorGui()` | Hook called every editor frame. Updates the modified splines; if the tool is not active, only draws the outlines. Otherwise handles the main window, the pan camera, material selection, mouse/keyboard events (splineInput) and the rendering of the splines. *(internal)* *(hook)* | 1664 |
| `editor_decalSpline.onEditorInitialized()` | Hook called at editor initialization: declares editor.editModes.decalSplineEditMode (decalRoad icon) and registers the 300x700 window. *(internal)* *(hook)* | 1731 |
| `editor_decalSpline.onSerialize()` | Save hook before Lua reload: returns the list of serialized splines ({} if there are none) and deletes the in-memory splines. *(internal)* *(hook)* | 108 |
| `editor_decalSpline.setLockedById(id, isLocked)` | Locks or unlocks the spline with the given id and rebuilds it immediately (also used by the Master Spline for its linked children). The decals are saved by the persistence manager in both cases: the lock only makes the spline non-editable. Does nothing if the id is unknown. | 96 |
| `editor_decalSpline.setSelectedNodeIdx(idx)` | Sets the index of the selected node (selection shared between tools). | 92 |
| `editor_decalSpline.setSelectedSplineIdx(idx)` | Sets the index of the selected spline (selection shared between tools). | 89 |

### Parameter details

#### `editor_decalSpline.onDeserialized(data)`

Restore hook after Lua reload: recreates the splines from the serialized data, takes back the decals kept from locked splines (populate.adopt), clamps the selected index and recomputes the id to index table.

- `data` (*table|nil*) : list of serialized splines (ignored if empty)

#### `editor_decalSpline.onSerialize()`

Save hook before Lua reload: returns the list of serialized splines ({} if there are none) and deletes the in-memory splines.

- **returns**: table serialized splines

#### `editor_decalSpline.setLockedById(id, isLocked)`

Locks or unlocks the spline with the given id and rebuilds it immediately (also used by the Master Spline for its linked children). The decals are saved by the persistence manager in both cases: the lock only makes the spline non-editable. Does nothing if the id is unknown.

- `id` (*integer*) : spline id
- `isLocked` (*boolean*) : true to lock

#### `editor_decalSpline.setSelectedNodeIdx(idx)`

Sets the index of the selected node (selection shared between tools).

- `idx` (*integer*) : node index, 1-based

#### `editor_decalSpline.setSelectedSplineIdx(idx)`

Sets the index of the selected spline (selection shared between tools).

- `idx` (*integer*) : spline index, 1-based

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/decalSpline.lua`.*
