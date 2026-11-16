# `editor_vehicleEditor_liveEditor_veJBeamPicker`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua` · VM: Game Engine (GE) · 805 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veJBeamPicker`: `extensions.load("editor_vehicleEditor_liveEditor_veJBeamPicker")`, then the global `editor_vehicleEditor_liveEditor_veJBeamPicker`

'JBeam Picker' window of the live Vehicle Editor: lets you choose nodes and beams of the vehicle (with the mouse, or by typing an ID/name with suggestions) and follow their data live. 'Nodes' / 'Beams' tab: tree of the chosen elements, choice of the data to display (node: velocity, relative velocity, force; beam: length, speed, force, stress, damping), filter by beam type (NORMALTYPE, BEAM_ANISOTROPIC, BEAM_BOUNDED, BEAM_PRESSURED, BEAM_LBEAM, BEAM_BROKEN, BEAM_HYDRO, BEAM_SUPPORT) and graphs (1000 points). Picking uses the game's Node/Beam debug modes (Ctrl+M / Ctrl+B).

## Notes

- The beam type values (0 to 7) correspond to the C++ engine constants and must not be changed.
- The dynamic data (force, velocity, stress...) is requested from the vehicle VM via be:queueObjectFastLua and returned in the tables M.nodeDataFromVELua[id][name] and M.beamDataFromVELua[id][name] by obj:queueGameEngineLua; it therefore arrives one frame late and is 0 before the first reply.
- The graphs advance by one sample per frame only when the simulation is running (be:getEnabled()).
- Units: m, m/s, N.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 790 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onEditorInitialized()` | Called at editor initialization: creates the beam type checkboxes. *(internal)* *(hook)* | 776 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 784 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt)` | Called every frame: draws the Nodes/Beams tabbed window and advances the graph offset. *(internal)* *(hook)* | 733 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Render hook emitted by editor_veMain: draws the chosen elements and runs the node or beam picking depending on the state. *(internal)* *(hook)* | 720 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.open()` | Opens the window. | 772 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale)` | Callback of the drawn-beams request: remembers the available beams and their scale (selection radius = 5 x scale). *(internal)* | 172 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale)` | Callback of the drawn-nodes request: remembers the list of nodes available for picking and their display scale (selection radius = 2 x scale). *(internal)* | 165 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt)`

Called every frame: draws the Nodes/Beams tabbed window and advances the graph offset.

- `dt` (*number*) : Time delta.

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Render hook emitted by editor_veMain: draws the chosen elements and runs the node or beam picking depending on the state.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale)`

Callback of the drawn-beams request: remembers the available beams and their scale (selection radius = 5 x scale).

- `beams` (*table*) : Beams available for picking.
- `scale` (*number*) : Drawing scale of the beams.

#### `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale)`

Callback of the drawn-nodes request: remembers the list of nodes available for picking and their display scale (selection radius = 2 x scale).

- `nodes` (*table*) : Nodes available for picking.
- `scale` (*number*) : Drawing scale of the nodes.

## Fields

| Field | Type | Description |
|---|---|---|
| `beamDataFromVELua` | table<integer, table<string, any>> | Beam data returned by the vehicle VM, keyed by beam ID then data name (speed, force, stress, damping). |
| `menuEntry` | string | 'JBeam Picker'. |
| `nodeDataFromVELua` | table<integer, table<string, any>> | Node data returned by the vehicle VM, keyed by node ID then data name (e.g. force). |

## Calls into the engine (C++)

- `be:` `getEnabled`, `queueObjectFastLua`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua`.*
