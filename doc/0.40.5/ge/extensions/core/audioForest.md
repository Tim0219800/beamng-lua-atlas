# `core_audioForest`

*File: `lua/ge/extensions/core/audioForest.lua` · VM: Game Engine (GE) · 613 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_audioForest`: `extensions.load("core_audioForest")`, then the global `core_audioForest`

GE extension (core_audioForest): runtime coordinator of forest audio emitters. From the level's Forest trees/objects, it builds a thinned cloud of audio nodes (audioForestCommon), then every frame computes the weighted average position of the nodes around the listener (radius 150 m) and moves a single SFX emitter (the 'main emitter') to that point while setting its FMOD parameters (RTPC). An independent 'roomtone' emitter can also play an ambience. Per-level settings are read from levels/<level>/dynamicAudioEmitters/forestData.audioSFX.json (created by the editor). The RTPCs: volume = intensity, pitch = node density, color = vegetation size, texture = unused; the global parameter g_ForestHeight = listener height relative to the forest centroid (or the terrain).

## Example

```lua
-- Driven by the editor or by the level file. Manual control:
core_audioForest.setMainEvent('event:>Ambiance>Forest>Mon_event')
core_audioForest.setEnabled(true)
```

## Notes

- Level file format: JSON lines (one 'meta' line, then one 'shape' line per forest model with include, classSel, classOvr).
- When the level loads (onClientCustomObjectSpawning) and after a Lua reload (onDeserialized), the state is rebuilt from the file; onSerialize returns nothing useful ({}).
- The node cloud computation is spread over several frames (runtimeLoadStepCount = 10000 objects per frame) via startRuntimePrepass/stepRuntimePrepass.
- Internal constants: listening radius 150 m, volume gain 30, g_ForestHeight write threshold 0.05 m, emitter raised by 0.05 m.
- Risk: onUpdate calls em:setPosition / em:setVolumePitchCT without checking that the main emitter exists; if enabled is true while mainEventName is empty (so there is no emitter), this raises a nil error (inferred from code).
- Node coordinates are in world meters; a node's depth (nodeDepth) is the object height multiplied by nodeHeightBlend (0.5).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_audioForest.clear()` | Resets the whole runtime state (emitters, nodes, tool state, settings). | 582 |
| `core_audioForest.clearMainAudio()` | Removes only the main audio path (emitter and event name). | 550 |
| `core_audioForest.getEmitterNodeIds()` | For the editor: returns the table {[1] = id of the nearest representative node} and size 1. | 540 |
| `core_audioForest.getMainEmitterDebugState()` | For editor visualization: current state of the main emitter. | 545 |
| `core_audioForest.getPersistedToolState()` | Returns the currently loaded tool state. | 180 |
| `core_audioForest.onClientCustomObjectSpawning()` | Hook called when the level objects are created: loads the level configuration and starts the prepass. *(internal)* *(hook)* | 517 |
| `core_audioForest.onClientEndMission()` | Hook called at the end of a level: resets the whole state. *(internal)* *(hook)* | 587 |
| `core_audioForest.onDeserialized(data)` | Hook after Lua reload: re-reads the level configuration and rebuilds the state. *(internal)* *(hook)* | 526 |
| `core_audioForest.onEditorBeforeSaveLevel()` | Hook called by the editor before the level is saved: writes the stored tool state to levels/<level>/dynamicAudioEmitters/forestData.audioSFX.json. *(internal)* *(hook)* | 531 |
| `core_audioForest.onSerialize()` | Serialization hook before Lua reload: returns an empty table. *(internal)* *(hook)* | 522 |
| `core_audioForest.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame by the extension system: advances the loading prepass, then moves the main emitter and sets its RTPCs according to the nodes near the listener (SFXSystem.getPositionXYZ). *(internal)* *(hook)* | 299 |
| `core_audioForest.setEnabled(v)` | Enables or disables the system. On enable, creates the main emitter if there is an event and nodes; on disable, removes it. | 395 |
| `core_audioForest.setMainEvent(eventName)` | Sets the FMOD event of the main emitter (without touching the roomtone). Empty string: removes the emitter. Otherwise updates the existing emitter or creates it if the system is enabled and has nodes. | 284 |
| `core_audioForest.setNodeCloud(cloud)` | Installs a node cloud produced by audioForestCommon.buildNodeCloudFromForest (used by the editor or the runtime). Fetches the terrain (core_terrain.getTerrain) and the global audio parameters; returns false and clears the state if the cloud is invalid or there is no terrain. | 253 |
| `core_audioForest.setPersistedToolState(st)` | Stores the editing tool state for saving the level. | 175 |
| `core_audioForest.setPitchDensityInv(v)` | Overrides the automatic pitch normalization (inverse of the number of reference sources). nil or value <= 0: reverts to automatic. | 407 |
| `core_audioForest.setRoomtoneEnabled(v)` | Enables or disables the independent 'roomtone' emitter (creates it if there is a roomtone event). | 416 |
| `core_audioForest.setRoomtoneEvent(eventName)` | Sets the roomtone event. No visible effect until the roomtone is enabled; empty string: removes the emitter. | 426 |
| `core_audioForest.setRoomtoneZ(v)` | Sets the altitude of the roomtone emitter (positioned at x=0, y=0). | 446 |

### Parameter details

#### `core_audioForest.getEmitterNodeIds()`

For the editor: returns the table {[1] = id of the nearest representative node} and size 1.

- **returns**: table<integer, integer> Array of node ids (0 if none)
- **returns**: integer Number of emitters (always 1)

#### `core_audioForest.getMainEmitterDebugState()`

For editor visualization: current state of the main emitter.

- **returns**: boolean true if the emitter is active (nodes are within the radius)
- **returns**: number x (m)
- **returns**: number y (m)
- **returns**: number z (m)
- **returns**: integer id of the representative node

#### `core_audioForest.getPersistedToolState()`

Returns the currently loaded tool state.

- **returns**: table|nil Tool state (see setPersistedToolState)

#### `core_audioForest.onDeserialized(data)`

Hook after Lua reload: re-reads the level configuration and rebuilds the state.

- `data` (*table*) : Data from onSerialize (ignored)

#### `core_audioForest.onSerialize()`

Serialization hook before Lua reload: returns an empty table.

- **returns**: table {}

#### `core_audioForest.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame by the extension system: advances the loading prepass, then moves the main emitter and sets its RTPCs according to the nodes near the listener (SFXSystem.getPositionXYZ).

- `dtReal` (*number*) : Real time step (s)
- `dtSim` (*number*) : Simulation time step (s)
- `dtRaw` (*number*) : Raw time step (s)

#### `core_audioForest.setEnabled(v)`

Enables or disables the system. On enable, creates the main emitter if there is an event and nodes; on disable, removes it.

- `v` (*boolean*) : true to enable

#### `core_audioForest.setMainEvent(eventName)`

Sets the FMOD event of the main emitter (without touching the roomtone). Empty string: removes the emitter. Otherwise updates the existing emitter or creates it if the system is enabled and has nodes.

- `eventName` (*string|nil*) : FMOD event name

#### `core_audioForest.setNodeCloud(cloud)`

Installs a node cloud produced by audioForestCommon.buildNodeCloudFromForest (used by the editor or the runtime). Fetches the terrain (core_terrain.getTerrain) and the global audio parameters; returns false and clears the state if the cloud is invalid or there is no terrain.

- `cloud` (*table*) : Cloud: nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, kdNodes
- **returns**: boolean true if installed

#### `core_audioForest.setPersistedToolState(st)`

Stores the editing tool state for saving the level.

- `st` (*table|nil*) : State: version, mainEvent, roomtoneEnabled, roomtoneEvent, roomtoneZ, includeByShape, classSelByShape, classOverrideByShape, nodeVisDrawRadius, nodeVisSphereRadius, showNodes, selectedRow

#### `core_audioForest.setPitchDensityInv(v)`

Overrides the automatic pitch normalization (inverse of the number of reference sources). nil or value <= 0: reverts to automatic.

- `v` (*number|nil*) : Factor 1 / number of sources

#### `core_audioForest.setRoomtoneEnabled(v)`

Enables or disables the independent 'roomtone' emitter (creates it if there is a roomtone event).

- `v` (*boolean*) : true to enable

#### `core_audioForest.setRoomtoneEvent(eventName)`

Sets the roomtone event. No visible effect until the roomtone is enabled; empty string: removes the emitter.

- `eventName` (*string|nil*) : FMOD event name

#### `core_audioForest.setRoomtoneZ(v)`

Sets the altitude of the roomtone emitter (positioned at x=0, y=0).

- `v` (*number|nil*) : Altitude in meters, 0 by default

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `directoryExists`
- `Sim.` `upcast`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/audioForest.lua`.*
