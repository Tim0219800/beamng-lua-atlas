# `gameplay_drift_general`

*File: `lua/ge/extensions/gameplay/drift/general.lua` · VM: Game Engine (GE) · 458 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_general`: `extensions.load("gameplay_drift_general")`, then the global `gameplay_drift_general`

Conductor of the drift gameplay. Keeps the current context (inFreeroam, inChallenge, inFreeroamChallenge, inAnotherMissionType, inFreeroamCruising, inSplitscreen), the challenge mode (None, A to B, A to B with stunt zones, Gymkhana, Competition), the pause/freeze states and the debug flag. On every context or mode change, it loads or unloads the other gameplay_drift_* extensions according to the variableExtensions table. A modder uses it to read the drift context or change it, and to reset the whole system.

## Example

```lua
if gameplay_drift_general.getContext() == "inFreeroam" then
  gameplay_drift_general.setContext("inFreeroamChallenge")
end
```

## Notes

- Extensions loaded per context: stuntZones (inChallenge), display (inChallenge, inFreeroamChallenge, inFreeroamCruising, inSplitscreen), quickMessages (inFreeroam, inChallenge, inFreeroamChallenge, inFreeroamCruising), bounds (inChallenge, inFreeroamChallenge), freeroam_driftSpots (inFreeroam, inFreeroamChallenge, inFreeroamCruising), scoreboard (inChallenge); per challenge mode: stallingSystem (Gymkhana), destination (A to B, A to B with stunt zones, with the inFreeroamChallenge context).
- Manual loading: freeroam_cruising (loaded only outside career, outside multiseat, if the enableDriftFreeroamCruising setting is active, outside the freeroam tutorial and outside first drive), sounds (loaded as long as gameplay_drift_display exists) and multiplayer (loaded via onMPSessionChanged).
- setContext always emits the onDriftContextChanged(context, oldContext) hook, even if the context does not change; the extensions are only reloaded if the context actually changed. Switching to inFreeroam forces the challenge mode to "None".
- The freeze (frozen) is true if the player is out of bounds, going the wrong way or in the concluding phase of a drift spot; it is recomputed every frame and set back to false by reset/clear.
- pause (paused) is used to suspend the drift systems during the end screen of mission challenges.
- getMultiplayerEnabled returns a session object or nil/false (not a strict boolean): true only if a multiplayer session exists.
- In checkLoadedExtensions, the local variable driftDebugInfo shadows the module's; and the call ext:getDriftDebugInfo() passes ext as the self argument to a function that does not need it (harmless).

**Dependencies (loaded first):** `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_statistics`, `gameplay_drift_saveLoad`, `gameplay_util_groundContact`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_general.clear()` | Calls reset() of all the loaded drift extensions (except general), sets frozen back to false then empties the cascade zones (gameplay_drift_stuntZones.clear). | 73 |
| `gameplay_drift_general.getChallengeMode()` | Returns the current challenge mode. | 196 |
| `gameplay_drift_general.getContext()` | Returns the current drift context. | 179 |
| `gameplay_drift_general.getDriftDebugInfo()` | Returns {default=true, canBeChanged=false} for the drift debug window. | 183 |
| `gameplay_drift_general.getExtensionDebug(extName)` | Indicates whether debug is enabled for a given drift extension (general debug active, extension known, checkbox ticked). | 187 |
| `gameplay_drift_general.getFrozen()` | Indicates whether drift scoring and detection are frozen (out of bounds, wrong way, concluding phase). | 192 |
| `gameplay_drift_general.getGeneralDebug()` | Indicates whether general debug is active. | 171 |
| `gameplay_drift_general.getMultiplayerEnabled()` | Returns a truthy value only if a multiplayer session is in progress and multiplayer drift is allowed. | 200 |
| `gameplay_drift_general.getPaused()` | Indicates whether the drift system is paused. | 175 |
| `gameplay_drift_general.onAnyMissionChanged(status, mission)` | Hook: called when a mission starts or stops. Does clear(); when a non-drift mission starts switches to "inAnotherMissionType"; when it stops sets pause/freeze back to false and the context to "inFreeroam". *(internal)* *(hook)* | 204 |
| `gameplay_drift_general.onClientEndMission()` | Hook: level end, puts the context back to "inFreeroam". *(internal)* *(hook)* | 427 |
| `gameplay_drift_general.onClientPostStartMission()` | Hook: called when the level is loaded; if no mission is in the foreground, switches to "inFreeroam" and does reset(). *(internal)* *(hook)* | 393 |
| `gameplay_drift_general.onDeserialized(data)` | Hook: restores debugFlag, context and challengeMode after a Lua reload. *(internal)* *(hook)* | 409 |
| `gameplay_drift_general.onExtensionLoaded()` | Hook: lists the lua files of /lua/ge/extensions/gameplay/drift for the tracking of extensions and debug. *(internal)* *(hook)* | 415 |
| `gameplay_drift_general.onMPSessionChanged(old, new)` | Hook: loads gameplay_drift_multiplayer when entering a multiplayer session and unloads it when leaving. *(internal)* *(hook)* | 419 |
| `gameplay_drift_general.onSerialize()` | Hook: saves debugFlag, context and challengeMode before a Lua reload. *(internal)* *(hook)* | 401 |
| `gameplay_drift_general.onUpdate()` | Called every frame: debug window, loading/unloading of the sounds and cruising, recomputation of the frozen state. *(internal)* *(hook)* | 385 |
| `gameplay_drift_general.onVehicleResetted(vid)` | Hook: if the vehicle put back in place is tracked by gameplay_drift_drift, emits onDriftPlVehReset(vid). *(internal)* *(hook)* | 217 |
| `gameplay_drift_general.reset()` | Calls reset() of all the loaded drift extensions (except general), sets frozen back to false then resets the cascade zones (gameplay_drift_stuntZones.reset). | 78 |
| `gameplay_drift_general.setChallengeMode(newChallengeMode)` | Changes the challenge mode and loads/unloads the extensions concerned. No effect if the mode is identical. | 136 |
| `gameplay_drift_general.setContext(newContext)` | Changes the drift context, emits onDriftContextChanged(newContext, oldContext) and updates the loaded extensions. | 147 |
| `gameplay_drift_general.setDebug(value)` | Enables/disables drift debug mode (imgui window "Drift general") and emits onDriftDebugChanged(value). | 163 |
| `gameplay_drift_general.setPaused(newPaused)` | Pauses the drift system (or resumes it). | 143 |

### Parameter details

#### `gameplay_drift_general.getChallengeMode()`

Returns the current challenge mode.

- **returns**: string|nil Challenge mode, nil as long as it has never been set.

#### `gameplay_drift_general.getContext()`

Returns the current drift context.

- **returns**: string|nil Current context.

#### `gameplay_drift_general.getDriftDebugInfo()`

Returns {default=true, canBeChanged=false} for the drift debug window.

- **returns**: table {default = true, canBeChanged = false}

#### `gameplay_drift_general.getExtensionDebug(extName)`

Indicates whether debug is enabled for a given drift extension (general debug active, extension known, checkbox ticked).

- `extName` (*string*) : Extension name, e.g. "gameplay_drift_scoreboard".
- **returns**: boolean true if debug of this extension is active.

#### `gameplay_drift_general.getFrozen()`

Indicates whether drift scoring and detection are frozen (out of bounds, wrong way, concluding phase).

- **returns**: boolean Freeze state.

#### `gameplay_drift_general.getGeneralDebug()`

Indicates whether general debug is active.

- **returns**: boolean Debug flag.

#### `gameplay_drift_general.getMultiplayerEnabled()`

Returns a truthy value only if a multiplayer session is in progress and multiplayer drift is allowed.

- **returns**: any True/false value (can be nil or a boolean).

#### `gameplay_drift_general.getPaused()`

Indicates whether the drift system is paused.

- **returns**: boolean Pause state.

#### `gameplay_drift_general.onAnyMissionChanged(status, mission)`

Hook: called when a mission starts or stops. Does clear(); when a non-drift mission starts switches to "inAnotherMissionType"; when it stops sets pause/freeze back to false and the context to "inFreeroam".

- `status` (*string*) : "started" or "stopped".
- `mission` (*table*) : Mission concerned (missionType is read).

#### `gameplay_drift_general.onDeserialized(data)`

Hook: restores debugFlag, context and challengeMode after a Lua reload.

- `data` (*table*) : Table returned by onSerialize.

#### `gameplay_drift_general.onMPSessionChanged(old, new)`

Hook: loads gameplay_drift_multiplayer when entering a multiplayer session and unloads it when leaving.

- `old` (*any*) : Old session (nil if none).
- `new` (*any*) : New session (nil if none).

#### `gameplay_drift_general.onSerialize()`

Hook: saves debugFlag, context and challengeMode before a Lua reload.

- **returns**: table {debugFlag, context, challengeMode}

#### `gameplay_drift_general.onVehicleResetted(vid)`

Hook: if the vehicle put back in place is tracked by gameplay_drift_drift, emits onDriftPlVehReset(vid).

- `vid` (*integer*) : Vehicle id.

#### `gameplay_drift_general.setChallengeMode(newChallengeMode)`

Changes the challenge mode and loads/unloads the extensions concerned. No effect if the mode is identical.

- `newChallengeMode` (*string*) : "None", "A to B", "A to B with stunt zones", "Gymkhana" or "Competition".

#### `gameplay_drift_general.setContext(newContext)`

Changes the drift context, emits onDriftContextChanged(newContext, oldContext) and updates the loaded extensions.

- `newContext` (*string*) : "inFreeroam", "inChallenge", "inFreeroamChallenge", "inAnotherMissionType", "inFreeroamCruising" or "inSplitscreen".

#### `gameplay_drift_general.setDebug(value)`

Enables/disables drift debug mode (imgui window "Drift general") and emits onDriftDebugChanged(value).

- `value` (*boolean*) : true to enable debug.

#### `gameplay_drift_general.setPaused(newPaused)`

Pauses the drift system (or resumes it).

- `newPaused` (*boolean*) : true to pause.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_statistics, gameplay_drift_saveLoad, gameplay_util_groundContact. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDriftContextChanged` — listened to by 3 module(s)
- `onDriftDebugChanged` — listened to by 3 module(s)
- `onDriftPlVehReset` — listened to by 4 module(s)

## Calls into the engine (C++)

- `FS:` `findFiles`

**Loads extensions:** `gameplay_drift_freeroam_cruising`, `gameplay_drift_multiplayer`, `gameplay_drift_sounds`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/general.lua`.*
