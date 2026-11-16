# `editor_vehicleEditor_liveEditor_veFlexbodyDebug`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua` · VM: Game Engine (GE) · 1171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veFlexbodyDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veFlexbodyDebug")`, then the global `editor_vehicleEditor_liveEditor_veFlexbodyDebug`

'Flexbody Debug' window of the live Vehicle Editor, to diagnose the vehicle's flexbodies (deformable meshes). 'Single Flexmesh' tab: choose a flexbody (sorted combo, favorites), set the mesh visibility, display the chosen flexbody, pick a node or a vertex with the mouse within a 'Max Dist from Cursor' radius (0 to 10 m) and visualize their relationships. 'All Flexmeshes' tab: find vertices without a nearby node and (expert mode) vertices with out-of-range coordinates. Depends on editor_veMain.

## Notes

- The per-vehicle settings (favorites) are saved in /settings/editor/flexbodyDebug_settings.json, keyed by JBeam file name.
- The state is kept per vehicle ID (deep copy of vehData); onVehicleSpawned deletes the state of the respawned vehicle so that it is rebuilt.
- Internal modes: default, node picking, nodes picked, vertex picking, vertices picked, display of vertices without nearby nodes.
- The search for vertices without nearby nodes enables vehicle:setFlexmeshDebugMode(true) and walks through all flexbodies: can be slow on a large vehicle.
- Drawing uses debugDrawer (drawLine, drawSphere, drawTextAdvanced) in the onVehicleEditorRenderJBeams hook.

**Dependencies (loaded first):** `editor_veMain`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 1157 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 1151 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt)` | Called every frame: initializes the vehicle state, draws the tabbed window and the side windows (out-of-range vertices, vertices without nodes). *(internal)* *(hook)* | 1108 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Render hook emitted by editor_veMain: draws the selected flexbody and runs the node/vertex picking according to the current mode. *(internal)* *(hook)* | 622 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id)` | When a vehicle spawns, forgets its remembered data. *(internal)* *(hook)* | 1143 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | On vehicle change, switches to the state of the new vehicle (or creates it). *(internal)* *(hook)* | 1139 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.open()` | Opens the window. | 1147 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt)`

Called every frame: initializes the vehicle state, draws the tabbed window and the side windows (out-of-range vertices, vertices without nodes).

- `dt` (*number*) : Time delta.

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Render hook emitted by editor_veMain: draws the selected flexbody and runs the node/vertex picking according to the current mode.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id)`

When a vehicle spawns, forgets its remembered data.

- `id` (*integer*) : Vehicle ID.

#### `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

On vehicle change, switches to the state of the new vehicle (or creates it).

- `oldVehicle` (*integer*) : ID of the old vehicle.
- `newVehicle` (*integer*) : ID of the new vehicle.
- `player` (*integer*) : Player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_veMain'}. |
| `menuEntry` | string | 'Flexbody Debug'. |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua`.*
