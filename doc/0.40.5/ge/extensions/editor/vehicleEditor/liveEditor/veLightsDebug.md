# `editor_vehicleEditor_liveEditor_veLightsDebug`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua` · VM: Game Engine (GE) · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veLightsDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veLightsDebug")`, then the global `editor_vehicleEditor_liveEditor_veLightsDebug`

'Lights Debug' window of the live Vehicle Editor. Draws with debugDrawer the vehicle's light props (vdata.props whose mesh is SPOTLIGHT or POINTLIGHT): for a spot, a sphere, a direction line of length lightRange and an arrow head; for a point light, a sphere and a translucent sphere of radius lightRange. Options: spots, points, X-Ray (no depth test), names, unit vectors (length 1).

## Notes

- Drawing is done in the onVehicleEditorRenderJBeams hook emitted by editor_veMain; the position comes from prop:getLiveTransformWorld() + vEditor.vehiclePos.
- A null drawLine is drawn before each prop as a workaround for a debugDrawer bug (noted in the code).
- setSolidTriCulling(false) is called every frame but never restored (commented-out line).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 147 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 141 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onUpdate()` | Called every frame: draws the window with the checkboxes. *(internal)* *(hook)* | 123 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Hook emitted by editor_veMain every render frame: draws the spots and point lights of the vehicle's props if the window is open. *(internal)* *(hook)* | 32 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.open()` | Opens the window. | 137 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Hook emitted by editor_veMain every render frame: draws the spots and point lights of the vehicle's props if the window is open.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Lights Debug'. |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`, `setSolidTriCulling`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua`.*
