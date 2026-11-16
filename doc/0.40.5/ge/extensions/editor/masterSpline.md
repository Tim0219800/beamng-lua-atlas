# `editor_masterSpline`

*File: `lua/ge/extensions/editor/masterSpline.lua` · VM: Game Engine (GE) · 1954 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline`: `extensions.load("editor_masterSpline")`, then the global `editor_masterSpline`

Master Spline tool of the World Editor ("masterSpline" edit mode). A Master Spline is a master curve (nodes, widths, normals) that drives a stack of layers, each linked to a child spline of another tool (mesh, assembly, decal, road, tree) offset laterally. The file mostly contains the imgui interface ("masterSpline" window, turn handles, gizmo, terraforming, auto road, homologation, session); the data lives in masterSpline/splineMgr.lua. It is meant for level creators, not for vehicles.

## Notes

- The public API is small: two selection setters and the serialization/editor hooks; almost everything else is local to the file.
- onEditorGui rebuilds the dirty Master Splines every frame even if the tool is not active (it then only draws the outlines via rSpline.renderShells).
- onSerialize is destructive: after serializing, it unlinks all the splines, deletes all the Master Splines then calls be:reloadCollision() (the collision is baked into the scene). The data must therefore be reloaded by onDeserialized.
- Auto road defaults: baseWidth 10, slopeAvoidance 1, bankingStrength 0.35, widthBlend 0.5. Lateral position slider between -5 and 5, DOI between 0 and 500.
- The file registers with splineInput.registerSplineTool and declares a session spec (Save/Load Session) grouping masters and linked children.

**Dependencies (loaded first):** `editor_assemblySpline`, `editor_decalSpline`, `editor_meshSpline`, `editor_roadSpline`, `editor_treeSpline`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_masterSpline.onClientEndMission()` | Hook called when leaving the map: unlinks and deletes all the Master Splines and recomputes the id-to-index table. *(internal)* *(hook)* | 1922 |
| `editor_masterSpline.onDeserialized(data)` | Deserialization hook: deletes the existing Master Splines, recreates those from data, then recomputes the id-to-index table. *(internal)* *(hook)* | 203 |
| `editor_masterSpline.onEditorGui()` | Hook called every editor frame: live optimization of the selected spline, rebuilding of dirty splines, then, if the tool is active, window, pan camera, engineered turn handles, mouse/keyboard events, terraforming and drawing. *(internal)* *(hook)* | 1788 |
| `editor_masterSpline.onEditorInitialized()` | Editor initialization hook: registers the "Master Spline" edit mode (editor.editModes.masterSpline) and the "masterSpline" window. *(internal)* *(hook)* | 1908 |
| `editor_masterSpline.onSerialize()` | Editor serialization hook: serializes all the Master Splines, unlinks their children, deletes the Master Splines and reloads the collision. *(internal)* *(hook)* | 183 |
| `editor_masterSpline.setSelectedNodeIdx(idx)` | Sets the index of the selected node (cross-selection between tools). | 145 |
| `editor_masterSpline.setSelectedSplineIdx(idx)` | Sets the index of the selected Master Spline (cross-selection between tools). | 142 |

### Parameter details

#### `editor_masterSpline.onDeserialized(data)`

Deserialization hook: deletes the existing Master Splines, recreates those from data, then recomputes the id-to-index table.

- `data` (*table[]*) : Data produced by onSerialize.

#### `editor_masterSpline.onSerialize()`

Editor serialization hook: serializes all the Master Splines, unlinks their children, deletes the Master Splines and reloads the collision.

- **returns**: table[] Array of the serialized Master Splines.

#### `editor_masterSpline.setSelectedNodeIdx(idx)`

Sets the index of the selected node (cross-selection between tools).

- `idx` (*integer*) : Node index (1-based).

#### `editor_masterSpline.setSelectedSplineIdx(idx)`

Sets the index of the selected Master Spline (cross-selection between tools).

- `idx` (*integer*) : Index in the list (1-based).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one to guarantee the serialization order: editor_assemblySpline, editor_decalSpline, editor_meshSpline, editor_roadSpline, editor_treeSpline. |

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline.lua`.*
