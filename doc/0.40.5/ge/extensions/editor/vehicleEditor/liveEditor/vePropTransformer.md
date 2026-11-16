# `editor_vehicleEditor_liveEditor_vePropTransformer`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua` · VM: Game Engine (GE) · 573 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_vePropTransformer`: `extensions.load("editor_vehicleEditor_liveEditor_vePropTransformer")`, then the global `editor_vehicleEditor_liveEditor_vePropTransformer`

'Prop Transformer' window of the live Vehicle Editor: lets you choose a prop (visual part such as a mirror or a lamp) of the vehicle by aiming at its reference node ('Pick Prop', wheel to cycle through overlapping props) then modify its transformation live: baseTranslation, baseTranslationGlobal (m), baseRotation, baseRotationGlobal (displayed in degrees, converted to radians for the engine), either by numeric fields or with the axis gizmo. The values "without nodeRotate/Offset/Move" can be copied to the clipboard in the JSON format "x":…, "y":…, "z":… to paste them into the jbeam.

## Notes

- The changes only apply to the live session; the values must be copied back into the jbeam.
- The clipboard values ignore the node transformations (nodeRotate/nodeOffset/nodeMove): they are those of the original jbeam.
- Rotations are entered in degrees (EnterReturnsTrue fields: confirmed with Enter) but stored in radians on the engine side.
- State kept per vehicle ID (copy of vehData); onVehicleSpawned deletes it and recreates it.
- Uses the same gizmos as nodeTransformer (setAxisGizmoRenderPlane, MoveGrid, PlaneHashes).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 560 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 554 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt)` | Called every frame: draws the window (Pick Prop button, translation/rotation fields, copy and gizmo buttons). *(internal)* *(hook)* | 452 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Render hook emitted by editor_veMain: initializes the state if needed, draws the chosen prop, applies the transformation via the gizmo and runs the prop picking (mode 2). *(internal)* *(hook)* | 433 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id)` | When a vehicle spawns, forgets then recreates its state. *(internal)* *(hook)* | 545 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player)` | On vehicle change, switches to the state of the new vehicle. *(internal)* *(hook)* | 541 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.open()` | Opens the window. | 550 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt)`

Called every frame: draws the window (Pick Prop button, translation/rotation fields, copy and gizmo buttons).

- `dt` (*number*) : Time delta.

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Render hook emitted by editor_veMain: initializes the state if needed, draws the chosen prop, applies the transformation via the gizmo and runs the prop picking (mode 2).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id)`

When a vehicle spawns, forgets then recreates its state.

- `id` (*integer*) : Vehicle ID.

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player)`

On vehicle change, switches to the state of the new vehicle.

- `oldVehicle` (*integer*) : ID of the old vehicle.
- `newVehicle` (*integer*) : ID of the new vehicle.
- `player` (*integer*) : Player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Prop Transformer'. |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `worldEditorCppApi.` `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua`.*
