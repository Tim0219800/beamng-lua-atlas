# `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua` · VM: Game Engine (GE) · 227 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`: `extensions.load("editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector")`, then the global `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`

'Node Triangle Self Collision Detector' window of the live Vehicle Editor. The 'Start Analysis' button tests, for each collidable triangle, which vehicle nodes pass within a given radius (0.025 to 0.1 m, 0.025 m being the real collision radius) of the triangle. Ignored: NONCOLLIDABLE triangles, the triangle's nodes, nodes without collision or without selfCollision, coupler nodes or nodes with couplerTag/tag, and nodes in the same first group as a triangle vertex. The pairs found are printed to the console and drawn (orange sphere, green triangle, texts).

## Notes

- O(triangles x nodes) complexity run in a single frame: can freeze the editor on a large vehicle.
- The results are stored per vehicle ID in vehsResultData and included in onSerialize.
- Distances in meters.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data)` | Restores the open state and the radius (data.nodeCollisionRadius). *(internal)* *(hook)* | 213 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize()` | Returns {windowOpen, nodeCollisionRadius, vehsResultData}. *(internal)* *(hook)* | 205 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onUpdate()` | Called every frame: draws the window (radius slider, Start Analysis / Clear Results buttons). *(internal)* *(hook)* | 177 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Render hook emitted by editor_veMain: draws the analysis results of the current vehicle (node sphere, triangle, labels). *(internal)* *(hook)* | 40 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.open()` | Opens the window. | 201 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data)`

Restores the open state and the radius (data.nodeCollisionRadius).

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize()`

Returns {windowOpen, nodeCollisionRadius, vehsResultData}.

- **returns**: table State to restore.

#### `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Render hook emitted by editor_veMain: draws the analysis results of the current vehicle (node sphere, triangle, labels).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Node Triangle Self Collision Detector'. |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawText`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua`.*
