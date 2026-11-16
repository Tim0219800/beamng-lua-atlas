# `editor_heroRoadEditor_groundmodel`

*File: `lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua` · VM: Game Engine (GE) · 201 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_groundmodel`: `extensions.load("editor_heroRoadEditor_groundmodel")`, then the global `editor_heroRoadEditor_groundmodel`

Groundmodel painting mode (dry, wet, snow, ice...) of the Hero Road Editor. The artist paints with the mouse on the roadway; the paint is stored as stamps in world coordinates in group.surfaceStamps ({x, y, r, m}), which mesh.lua rasterizes onto the quads at build time. The module manages the mode state, the brush input (one undo per stroke) and the editor overlay (colored cells, cursor, wireframe). In-game rendering does not change; only the physics changes.

## Notes

- matIndex: index in the surfaceKit palette; 1 = Dry = eraser; default 2 (first non-base, Wet).
- Default brush radius 3.0 m; the stamp spacing along a stroke is max(0.25, radius*0.5) m.
- The physics rebuild is deferred: painting only puts the group in the pending queue; groupMgr.rebuildSurfaceOnly is only called after requestApply (Apply button), via flushPending on the next frame.
- The raycast under the mouse uses castRayStatic with a range of 2000 m; the mouse is ignored if ImGui captures it or if the axis gizmo is hovered.
- The wireframe is limited to 90 m around the camera.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_groundmodel.clearAll(group)` | Removes all the paint of the group (empties surfaceStamps) and puts it in the rebuild queue. The caller handles the undo commit. | 78 |
| `editor_heroRoadEditor_groundmodel.drawOverlay(group)` | Editor overlay: tints each grid cell (roadway + shoulders) with the material's color (alpha 60 for the base, 135 for painted), plus an optional wireframe. Reads the same stamps and the same grid (group.meshGrid) as the mesh, so consistent with the physics. Only for the selected road. | 146 |
| `editor_heroRoadEditor_groundmodel.flushPending()` | Rebuilds the physics mesh of each road painted since the last Apply (light surface-only path: mesh + collision, without decals/furniture/terrain paint), then empties the queue. Has no effect if Apply was not requested. Called every frame from onEditorGui. *(internal)* | 71 |
| `editor_heroRoadEditor_groundmodel.getBrushDefault()` | Default brush radius (3.0). | 55 |
| `editor_heroRoadEditor_groundmodel.getBrushRadius()` | Current brush radius. | 53 |
| `editor_heroRoadEditor_groundmodel.getMatIndex()` | Index of the palette material currently being painted. | 51 |
| `editor_heroRoadEditor_groundmodel.getShowWire()` | Indicates whether the roadway wireframe is displayed. | 56 |
| `editor_heroRoadEditor_groundmodel.isActive()` | Indicates whether the paint mode is active. | 50 |
| `editor_heroRoadEditor_groundmodel.requestApply()` | Requests the physics rebuild of the painted roads (Apply button). Consumed by flushPending on the next frame. | 66 |
| `editor_heroRoadEditor_groundmodel.setActive(b)` | Enables or disables the mode; when disabling, interrupts any stroke in progress. | 59 |
| `editor_heroRoadEditor_groundmodel.setBrushRadius(r)` | Sets the brush radius. | 54 |
| `editor_heroRoadEditor_groundmodel.setMatIndex(i)` | Chooses the painted material. | 52 |
| `editor_heroRoadEditor_groundmodel.setShowWire(b)` | Shows or hides the roadway wireframe. | 57 |
| `editor_heroRoadEditor_groundmodel.updateAndPaint(group)` | Every frame in active mode: draws the brush cursor (sphere + disc) at the aimed point and, while dragging the left button, deposits stamps {x,y,r,m} at regular spacing. A single 'Paint Groundmodel' history commit per stroke. | 101 |

### Parameter details

#### `editor_heroRoadEditor_groundmodel.clearAll(group)`

Removes all the paint of the group (empties surfaceStamps) and puts it in the rebuild queue. The caller handles the undo commit.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_groundmodel.drawOverlay(group)`

Editor overlay: tints each grid cell (roadway + shoulders) with the material's color (alpha 60 for the base, 135 for painted), plus an optional wireframe. Reads the same stamps and the same grid (group.meshGrid) as the mesh, so consistent with the physics. Only for the selected road.

- `group` (*table*) : Selected Hero Road group (meshGrid required).

#### `editor_heroRoadEditor_groundmodel.getBrushDefault()`

Default brush radius (3.0).

- **returns**: number Meters.

#### `editor_heroRoadEditor_groundmodel.getBrushRadius()`

Current brush radius.

- **returns**: number Radius in meters.

#### `editor_heroRoadEditor_groundmodel.getMatIndex()`

Index of the palette material currently being painted.

- **returns**: integer Index (1 = Dry/eraser).

#### `editor_heroRoadEditor_groundmodel.getShowWire()`

Indicates whether the roadway wireframe is displayed.

- **returns**: boolean true if displayed.

#### `editor_heroRoadEditor_groundmodel.isActive()`

Indicates whether the paint mode is active.

- **returns**: boolean true if active.

#### `editor_heroRoadEditor_groundmodel.setActive(b)`

Enables or disables the mode; when disabling, interrupts any stroke in progress.

- `b` (*boolean*) : New state.

#### `editor_heroRoadEditor_groundmodel.setBrushRadius(r)`

Sets the brush radius.

- `r` (*number*) : Radius in meters.

#### `editor_heroRoadEditor_groundmodel.setMatIndex(i)`

Chooses the painted material.

- `i` (*integer*) : Index in the surfaceKit palette.

#### `editor_heroRoadEditor_groundmodel.setShowWire(b)`

Shows or hides the roadway wireframe.

- `b` (*boolean*) : New state (converted to a boolean).

#### `editor_heroRoadEditor_groundmodel.updateAndPaint(group)`

Every frame in active mode: draws the brush cursor (sphere + disc) at the aimed point and, while dragging the left button, deposits stamps {x,y,r,m} at regular spacing. A single 'Paint Groundmodel' history commit per stroke.

- `group` (*table*) : Selected Hero Road group.
- **returns**: boolean true if the mode owns the mouse (active and valid group), false otherwise.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua`.*
