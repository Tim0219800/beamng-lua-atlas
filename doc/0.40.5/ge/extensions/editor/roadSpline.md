# `editor_roadSpline`

*File: `lua/ge/extensions/editor/roadSpline.lua` · VM: Game Engine (GE) · 1699 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadSpline`: `extensions.load("editor_roadSpline")`, then the global `editor_roadSpline`

"Road Spline" tool of the level editor: you draw a spline (nodes + widths) and the tool automatically generates DecalRoads stacked in layers (roadway, center/edge lines, edge fades, tire marks, cracks, patches...), with optional terrain painting. This file is mostly the ImGui interface ("roadSplineEditor" window, "Road Spline" edit mode); the data logic is in editor/roadSpline/groupMgr and layerMgr. It also registers the "Convert to Road Spline" entry in the scene tree context menu to convert existing DecalRoads. Useful to a modder mainly to lock/select a spline from another tool (Master Spline).

## Notes

- The scene folder created for each spline is only saved with the level if the road is locked ("baked"); otherwise it is transient (cansave = false).
- onSerialize/onDeserialized are used for reloading Lua extensions: a locked road keeps its DecalRoads in the scene, only their ids are taken back on return (groupMgr.release/adopt).
- Even if the tool is not active, onEditorGui rebuilds the dirty groups and draws the spline "hulls".

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadSpline.onClientEndMission()` | Called when leaving the level: deletes the active unlinked groups (locked and linked ones stay in the list) and recomputes the id -> index table. *(internal)* *(hook)* | 1680 |
| `editor_roadSpline.onDeserialized(data)` | Deserialization hook after Lua reload: recreates the groups, takes back the kept DecalRoads of the locked roads (groupMgr.adopt) and recomputes the id -> index table. *(internal)* *(hook)* | 162 |
| `editor_roadSpline.onEditorGui()` | Called every frame by the editor. Updates the dirty groups (even if the tool is inactive), then, if the tool is active, draws the main window, handles the selection polygon, material selection, wireframe, nodes/handles and the gizmo. *(internal)* *(hook)* | 1504 |
| `editor_roadSpline.onEditorInitialized()` | Called when the editor initializes: declares the roadSplineEditor edit mode ("Road Spline"), registers the tool window and the material selection window, and adds "Convert to Road Spline" to the scene tree context menu. *(internal)* *(hook)* | 1657 |
| `editor_roadSpline.onSerialize()` | Serialization hook before Lua reload. Returns the list of encoded groups; for a locked road, stores the ids of its DecalRoads (keptObjects) and leaves the objects in the scene. Then empties the list of groups. *(internal)* *(hook)* | 144 |
| `editor_roadSpline.setLockedById(id, isLocked)` | Locks or unlocks the spline whose id is given and rebuilds it immediately. When locked (isEnabled = false), the road is no longer rebuilt by the tool and its DecalRoads are saved with the level. Also used by the Master Spline for linked child splines. Does nothing if the id is unknown. | 86 |
| `editor_roadSpline.setSelectedNodeIdx(idx)` | Sets the index of the selected node in the current spline (selection shared between tools). | 119 |
| `editor_roadSpline.setSelectedSplineIdx(idx)` | Sets the index of the selected spline in the tool (selection shared between tools). | 116 |

### Parameter details

#### `editor_roadSpline.onDeserialized(data)`

Deserialization hook after Lua reload: recreates the groups, takes back the kept DecalRoads of the locked roads (groupMgr.adopt) and recomputes the id -> index table.

- `data` (*table*) : Value returned by onSerialize.

#### `editor_roadSpline.onSerialize()`

Serialization hook before Lua reload. Returns the list of encoded groups; for a locked road, stores the ids of its DecalRoads (keptObjects) and leaves the objects in the scene. Then empties the list of groups.

- **returns**: table Array of serialized groups (strings encoded by string.buffer).

#### `editor_roadSpline.setLockedById(id, isLocked)`

Locks or unlocks the spline whose id is given and rebuilds it immediately. When locked (isEnabled = false), the road is no longer rebuilt by the tool and its DecalRoads are saved with the level. Also used by the Master Spline for linked child splines. Does nothing if the id is unknown.

- `id` (*string*) : Identifier (UUID) of the group/spline.
- `isLocked` (*boolean*) : true to lock (the last displayed state is rebuilt first), false to unlock.

#### `editor_roadSpline.setSelectedNodeIdx(idx)`

Sets the index of the selected node in the current spline (selection shared between tools).

- `idx` (*integer*) : Index (1-based) of the node.

#### `editor_roadSpline.setSelectedSplineIdx(idx)`

Sets the index of the selected spline in the tool (selection shared between tools).

- `idx` (*integer*) : Index (1-based) in the list of groups.

## Calls into the engine (C++)

- `obj:` `getClassName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadSpline.lua`.*
