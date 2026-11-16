# `core_sounds`

*File: `lua/ge/extensions/core/sounds.lua` · VM: Game Engine (GE) · 263 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_sounds`: `extensions.load("core_sounds")`, then the global `core_sounds`

Bridge between the game and the FMOD audio engine on the GE side. On each render (onPreRender), it pushes global parameters (camera speed and rotation, time of day, wind, player vehicle speed, interior camera, underwater, height above ground and sea, audio blur). It also provides functions to initialize and drive a vehicle's engine/exhaust sounds, and handles the audio blur when a mission menu is open.

## Example

```lua
core_sounds.setAudioBlur(1) -- audio blur active
core_sounds.setAudioBlur(0)
```

## Notes

- onPreRender alternates on each call (frameFlag) between two batches of parameters: one frame out of two for g_Tod, g_WindSpeedMS, g_CamRotationAngle, g_VehicleSpeedPlayerMS; the other for g_CamOnboard, c_CabinFilterReverbStrength, g_CamFree, g_CamUnderwater, g_UnderwaterDepth, g_CamHeightToGround, g_CamHeightToSea. g_GameAudioBlur, g_CamSpeedMS and g_CamRotationSpeedMS are updated every frame.
- Time of day: tod.time is 0 at noon, 0.25 at 6 pm, 0.5 at midnight, 0.75 at 6 am; the code converts it to hours (0 to 24) for g_Tod.
- g_CamOnboard = AudioInsideModifier (setting) to the power of 4, multiplied by the result of core_camera.isCameraInside.
- The downward castRayStatic ray for g_CamHeightToGround is limited to 200 m.
- Automatic audio blur is only enabled while an interaction with a mission marker is in progress (missionMarkerInteraction, set by onActivityAcceptGatherData).
- The "debugEnabled" comment says to change the line to enable audio blur logs; the variable is local and equals false.

**Dependencies (loaded first):** `core_camera`, `core_settings_settings`, `core_input_bindings`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_sounds.initEngineSound(vehicleId, engineId, jsonPath, nodeIdArray, noloadVol, loadVol)` | Initializes a vehicle's engine sound: vehicle:engineSoundInit, then sets wet_level = 0 and dry_level = 1. Does nothing if the vehicle does not exist. | 95 |
| `core_sounds.initExhaustSound(vehicleId, engineId, jsonPath, nodeIdPairArray, noloadVol, loadVol)` | Like initEngineSound but for the exhaust, with node pairs. Also calls vehicle:engineSoundInit (same engine call). | 106 |
| `core_sounds.onActivityAcceptGatherData(elemData, activityData)` | Hook called when an activity gathers its acceptance data. Remembers whether any of the items is of type "mission". *(internal)* *(hook)* | 202 |
| `core_sounds.onDeserialized(data)` | Hook called after Lua extensions are reloaded: reruns sounds.updateCabinFilter() on all vehicles to restore cabinFilterStrength. *(internal)* *(hook)* | 232 |
| `core_sounds.onMissionAvailabilityChanged(data)` | Hook: if data.missionCount is 0, disables the mission interaction. *(internal)* *(hook)* | 214 |
| `core_sounds.onMissionInfoChangedState(fromState, toState, content)` | Hook called when the mission info window changes state: switching to 'opened' enables the interaction; 'opened' to 'closed' disables it and resets the blur to 0. No effect if no mission marker is active. *(internal)* *(hook)* | 186 |
| `core_sounds.onPreRender(dtReal, dtSim, dtRaw)` | Render hook. Updates the global FMOD parameters (Engine.Audio.getGlobalParams) if available. See notes for the list of parameters. *(internal)* *(hook)* | 32 |
| `core_sounds.onSettingsChanged()` | Hook called when settings change: re-reads AudioInsideModifier. *(internal)* *(hook)* | 143 |
| `core_sounds.onUiChangedState(toState, fromState)` | Hook called when the UI state changes. If a mission marker is active, handles gameAudioBlurValue: 1 while interacting with the mission UI, reset to 0 for transitions to play (from scenario.start, menu, fadeScreen, blank) or to scenario.end. *(internal)* *(hook)* | 147 |
| `core_sounds.onVehicleSwitched(oldId, newId, player)` | Hook: when player 0's vehicle changes, runs sounds.updateCabinFilter() in the new vehicle's VM. *(internal)* *(hook)* | 225 |
| `core_sounds.setAudioBlur(value)` | Manually sets the value of the global audio blur (parameter g_GameAudioBlur). | 255 |
| `core_sounds.setCabinFilterStrength(objId, value)` | Sets cabinFilterStrength, but only if objId is player vehicle 0. Typically called from the vehicle VM. | 220 |
| `core_sounds.setEngineSoundParameter(vehicleId, engineId, paramName, paramValue)` | Sets an engine sound parameter (vehicle:engineSoundParameter). | 124 |
| `core_sounds.setEngineSoundParameterList(vehicleId, engineId, parameters)` | Sets several engine sound parameters at once. | 130 |
| `core_sounds.setExhaustSoundNodes(vehicleId, engineId, nodeIdPairArray)` | Changes the exhaust sound emitter nodes (vehicle:engineSoundNodes). | 136 |
| `core_sounds.updateEngineSound(vehicleId, engineId, rpm, onLoad, engineVolume)` | Updates the engine sound (vehicle:engineSoundUpdate). | 118 |

### Parameter details

#### `core_sounds.initEngineSound(vehicleId, engineId, jsonPath, nodeIdArray, noloadVol, loadVol)`

Initializes a vehicle's engine sound: vehicle:engineSoundInit, then sets wet_level = 0 and dry_level = 1. Does nothing if the vehicle does not exist.

- `vehicleId` (*integer*) : Vehicle object id.
- `engineId` (*integer*) : Engine identifier (inferred from code).
- `jsonPath` (*string*) : Path of the sound description file.
- `nodeIdArray` (*integer|integer[]*) : Emitter node(s); a single number is wrapped into a table.
- `noloadVol` (*number|nil*) : Volume at no load, 1 by default.
- `loadVol` (*number|nil*) : Volume under load, 1 by default.

#### `core_sounds.initExhaustSound(vehicleId, engineId, jsonPath, nodeIdPairArray, noloadVol, loadVol)`

Like initEngineSound but for the exhaust, with node pairs. Also calls vehicle:engineSoundInit (same engine call).

- `vehicleId` (*integer*) : Vehicle id.
- `engineId` (*integer*) : Engine identifier.
- `jsonPath` (*string*) : Path of the sound file.
- `nodeIdPairArray` (*table|integer*) : Table of node pairs; a single number becomes {{n, n}}.
- `noloadVol` (*number|nil*) : Volume at no load, 1 by default.
- `loadVol` (*number|nil*) : Volume under load, 1 by default.

#### `core_sounds.onActivityAcceptGatherData(elemData, activityData)`

Hook called when an activity gathers its acceptance data. Remembers whether any of the items is of type "mission".

- `elemData` (*table[]*) : List of items with a type field.
- `activityData` (*any*) : Unused (log only).

#### `core_sounds.onDeserialized(data)`

Hook called after Lua extensions are reloaded: reruns sounds.updateCabinFilter() on all vehicles to restore cabinFilterStrength.

- `data` (*any*) : Not used.

#### `core_sounds.onMissionAvailabilityChanged(data)`

Hook: if data.missionCount is 0, disables the mission interaction.

- `data` (*table|nil*) : Table with missionCount.

#### `core_sounds.onMissionInfoChangedState(fromState, toState, content)`

Hook called when the mission info window changes state: switching to 'opened' enables the interaction; 'opened' to 'closed' disables it and resets the blur to 0. No effect if no mission marker is active.

- `fromState` (*string*) : Old state.
- `toState` (*string*) : New state.
- `content` (*any*) : Not used.

#### `core_sounds.onPreRender(dtReal, dtSim, dtRaw)`

Render hook. Updates the global FMOD parameters (Engine.Audio.getGlobalParams) if available. See notes for the list of parameters.

- `dtReal` (*number*) : Real frame duration (s).
- `dtSim` (*number*) : Simulated duration (s); if 0, camera speeds are not updated.
- `dtRaw` (*number*) : Raw duration (unused).

#### `core_sounds.onUiChangedState(toState, fromState)`

Hook called when the UI state changes. If a mission marker is active, handles gameAudioBlurValue: 1 while interacting with the mission UI, reset to 0 for transitions to play (from scenario.start, menu, fadeScreen, blank) or to scenario.end.

- `toState` (*string*) : New UI state.
- `fromState` (*string*) : Old UI state.

#### `core_sounds.onVehicleSwitched(oldId, newId, player)`

Hook: when player 0's vehicle changes, runs sounds.updateCabinFilter() in the new vehicle's VM.

- `oldId` (*integer*) : Old id.
- `newId` (*integer*) : New id.
- `player` (*integer*) : Player index; ignored if different from 0.

#### `core_sounds.setAudioBlur(value)`

Manually sets the value of the global audio blur (parameter g_GameAudioBlur).

- `value` (*number*) : 0 = no blur, 1 = maximum blur (inferred from code).

#### `core_sounds.setCabinFilterStrength(objId, value)`

Sets cabinFilterStrength, but only if objId is player vehicle 0. Typically called from the vehicle VM.

- `objId` (*integer*) : Id of the emitting vehicle.
- `value` (*number*) : Strength 0 to 1.

#### `core_sounds.setEngineSoundParameter(vehicleId, engineId, paramName, paramValue)`

Sets an engine sound parameter (vehicle:engineSoundParameter).

- `vehicleId` (*integer*) : Vehicle id.
- `engineId` (*integer*) : Engine identifier.
- `paramName` (*string*) : Parameter name.
- `paramValue` (*number*) : Value.

#### `core_sounds.setEngineSoundParameterList(vehicleId, engineId, parameters)`

Sets several engine sound parameters at once.

- `vehicleId` (*integer*) : Vehicle id.
- `engineId` (*integer*) : Engine identifier.
- `parameters` (*table<string, number>*) : Name -> value (inferred from code).

#### `core_sounds.setExhaustSoundNodes(vehicleId, engineId, nodeIdPairArray)`

Changes the exhaust sound emitter nodes (vehicle:engineSoundNodes).

- `vehicleId` (*integer*) : Vehicle id.
- `engineId` (*integer*) : Engine identifier.
- `nodeIdPairArray` (*table*) : Table of node pairs.

#### `core_sounds.updateEngineSound(vehicleId, engineId, rpm, onLoad, engineVolume)`

Updates the engine sound (vehicle:engineSoundUpdate).

- `vehicleId` (*integer*) : Vehicle id.
- `engineId` (*integer*) : Engine identifier.
- `rpm` (*number*) : Engine speed (RPM).
- `onLoad` (*number*) : Engine load (inferred from code).
- `engineVolume` (*number*) : Engine volume.

## Fields

| Field | Type | Description |
|---|---|---|
| `cabinFilterStrength` | number | Cabin filter/reverb strength (0 to 1, clamped when sent) for the interior camera of the player vehicle. Default 1. Written by setCabinFilterStrength. |
| `dependencies` | string[] | core_camera, core_settings_settings, core_input_bindings. |

## Calls into the engine (C++)

- `Sim.` `upcast`
- `core_environment.` `getGroundWind`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/sounds.lua`.*
