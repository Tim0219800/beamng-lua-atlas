# `core_vehicleMirrors`

*File: `lua/ge/extensions/core/vehicleMirrors.lua` · VM: Game Engine (GE) · 145 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicleMirrors`: `extensions.load("core_vehicleMirrors")`, then the global `core_vehicleMirrors`

GE extension `core_vehicleMirrors`: draft of mirror reflection rendering. Follows player 0's vehicle, requests its mirror data through the onVehicleMirrorsChanged hook, then contains (renderMirrors) the code that computes the reflection direction and calls veh:renderCameraToMaterial to a 128x128 texture (FOV 70). As is, this rendering is disabled: the call to renderMirrors and to the adjustment UI are commented out in onPreRender. The extension is therefore practically inert.

## Notes

- Distinct from core_vehicle_mirror (angle adjustment).
- The module itself calls extensions.hook('onVehicleMirrorsChanged', vehId, vData.mirrors or {}) from onPreRender, then receives this hook (onVehicleMirrorsChanged) like any extension; `vData.mirrors` is read from the vehicle's bundle (the jbeam field is rather vData.vdata.mirrors, hence probably always {}).
- The (unexecuted) rendering code assumes for each mirror the fields id1, id2, id3 (nodes), textureTarget and userCorrection (vec3 added by this module).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicleMirrors.onPreRender(dtReal, dtSim, dtRaw)` | Per-frame hook before rendering: detects a vehicle change of player 0 and triggers a mirror data request (onVehicleMirrorsChanged hook). The mirror rendering itself is commented out. *(internal)* *(hook)* | 108 |
| `core_vehicleMirrors.onVehicleMirrorsChanged(id, data)` | Hook (emitted by this module): receives the mirror data of the followed vehicle (ignored for another vehicle), stores it and adds to each mirror a userCorrection field (zero vec3). *(internal)* *(hook)* | 128 |
| `core_vehicleMirrors.onVehicleSwitched(oldVehId, newVehId)` | Hook: the player changes vehicle (does nothing). *(internal)* *(hook)* | 9 |

### Parameter details

#### `core_vehicleMirrors.onPreRender(dtReal, dtSim, dtRaw)`

Per-frame hook before rendering: detects a vehicle change of player 0 and triggers a mirror data request (onVehicleMirrorsChanged hook). The mirror rendering itself is commented out.

- `dtReal` (*number*) : real time (s)
- `dtSim` (*number*) : simulation time (s)
- `dtRaw` (*number*) : raw time (s)

#### `core_vehicleMirrors.onVehicleMirrorsChanged(id, data)`

Hook (emitted by this module): receives the mirror data of the followed vehicle (ignored for another vehicle), stores it and adds to each mirror a userCorrection field (zero vec3).

- `id` (*integer*) : vehicle
- `data` (*table*) : mirror table

#### `core_vehicleMirrors.onVehicleSwitched(oldVehId, newVehId)`

Hook: the player changes vehicle (does nothing).

- `oldVehId` (*integer*) : old vehicle
- `newVehId` (*integer*) : new vehicle

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleMirrorsChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `setDrawingEnabled`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicleMirrors.lua`.*
