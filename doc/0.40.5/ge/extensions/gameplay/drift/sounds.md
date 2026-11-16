# `gameplay_drift_sounds`

*File: `lua/ge/extensions/gameplay/drift/sounds.lua` · VM: Game Engine (GE) · 216 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_sounds`: `extensions.load("gameplay_drift_sounds")`, then the global `gameplay_drift_sounds`

Manages drift UI sounds (FMOD events UI>Career>Drift_*): a continuous sound during a drift whose pitch follows the performance factor, a sound on each new tier, on each combo change, when the drift is canceled (crash/spinout) and when points are validated. Also contains a "Drift audio" imgui window to simulate a drift in debug. Loaded by gameplay_drift_general as long as the drift display extension is loaded.

## Notes

- Sounds: continuousDrift = event:>UI>Career>Drift_Counting, newTier = Drift_Tier, newCombo1 = Drift_Combo_1x, newCombo5 = Drift_Combo_5x, driftCanceled = Drift_Canceled, pointsConfirmed = Drift_PointsReceived.
- The continuous sound is cut when the drift is paused or frozen (gameplay_drift_general.getPaused/getFrozen); otherwise it plays as long as gameplay_drift_drift.getIsDrifting() is true.
- The tier sound volume is tierData.order - 1 (so 0 for the tier of order 1).
- The combo sound uses comboChange <= 0.2 to choose Combo_1x, otherwise Combo_5x.
- The local function reset() is not exported: general.reset therefore cannot call it.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_sounds.getDriftDebugInfo()` | Returns {default=false, canBeChanged=true} for the drift debug window. | 67 |
| `gameplay_drift_sounds.onDriftCompletedScored(data)` | Hook: plays the points received sound. *(internal)* *(hook)* | 186 |
| `gameplay_drift_sounds.onDriftCrash()` | Hook: plays the drift cancel sound. *(internal)* *(hook)* | 172 |
| `gameplay_drift_sounds.onDriftDebugChanged(value)` | Hook: when debug is disabled, stops the drift simulation (gameplay_drift_drift.simulateADrift()). *(internal)* *(hook)* | 180 |
| `gameplay_drift_sounds.onDriftNewCombo(data)` | Hook: plays the 1x or 5x combo sound depending on the size of the change. *(internal)* *(hook)* | 159 |
| `gameplay_drift_sounds.onDriftSpinout()` | Hook: plays the drift cancel sound. *(internal)* *(hook)* | 176 |
| `gameplay_drift_sounds.onExtensionUnloaded()` | Hook: removes the audio source of the continuous sound on unload. *(internal)* *(hook)* | 195 |
| `gameplay_drift_sounds.onNewDriftTierReached(tierData)` | Hook: plays the new tier sound. *(internal)* *(hook)* | 153 |
| `gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw)` | Called every frame: on the first call creates the audio source of the continuous sound, displays the debug window, then plays/stops the continuous sound and updates its pitch parameter and its position (camera). *(internal)* *(hook)* | 135 |

### Parameter details

#### `gameplay_drift_sounds.getDriftDebugInfo()`

Returns {default=false, canBeChanged=true} for the drift debug window.

- **returns**: table {default = false, canBeChanged = true}

#### `gameplay_drift_sounds.onDriftCompletedScored(data)`

Hook: plays the points received sound.

- `data` (*table*) : Scored drift data (unused).

#### `gameplay_drift_sounds.onDriftDebugChanged(value)`

Hook: when debug is disabled, stops the drift simulation (gameplay_drift_drift.simulateADrift()).

- `value` (*boolean*) : New debug state.

#### `gameplay_drift_sounds.onDriftNewCombo(data)`

Hook: plays the 1x or 5x combo sound depending on the size of the change.

- `data` (*table*) : {comboChange = number}.

#### `gameplay_drift_sounds.onNewDriftTierReached(tierData)`

Hook: plays the new tier sound.

- `tierData` (*table*) : Tier data; order is used for the volume.

#### `gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw)`

Called every frame: on the first call creates the audio source of the continuous sound, displays the debug window, then plays/stops the continuous sound and updates its pitch parameter and its position (camera).

- `dtReal` (*number*) : Real time delta (unused).
- `_dtSim` (*number*) : Simulated delta time, stored for debug transitions.
- `dtRaw` (*number*) : Raw time delta (unused).

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onNewDriftTierReached` — listened to by 2 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/sounds.lua`.*
