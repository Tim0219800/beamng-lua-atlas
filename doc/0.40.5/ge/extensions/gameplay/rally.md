# `gameplay_rally`

*File: `lua/ge/extensions/gameplay/rally.lua` · VM: Game Engine (GE) · 538 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally`: `extensions.load("gameplay_rally")`, then the global `gameplay_rally`

Entry point of rally mode (gameplay_rally extension). It owns the rally manager (RallyManager) loaded for a mission, relays updates to the recce app (RecceApp) and to the manager, provides the debug toolbox (ImGui), places a dummy co-driver in the driver's mirror seat, forwards input actions (recce, co-driver pacing) and handles the theme color of the UI streams. A rally modder uses it to load/unload a rally, read its state or adjust the co-driver pacing.

## Example

```lua
local ok, err = gameplay_rally.loadMission(missionId, missionDir, nil, nil, {owner = 'mission'})
if gameplay_rally.isReady() then local rm = gameplay_rally.getRallyManager() end
gameplay_rally.setUiColor('#ff0000')
```

## Notes

- Manager owner (options.owner): 'mission', 'recce' or 'external' (default). A 'mission' owner is always allowed; 'recce' only in freeroam; the others are refused if a mission is in the foreground or if the manager belongs to a mission.
- loadMission and unloadMission return false and a reason when the operation is refused or fails; getErrorMsgForUser keeps the message intended for the user.
- The dummy co-driver is only placed if the owner is 'mission': the driver's mirror seat (L<->R) via gameplay_seatOccupants, replaced at the onSeatOccupantEnter/Exit hooks.
- onUpdate does not update the manager while the recce recording is in progress (RecceApp.isRecording).
- The stage runtime's authority mode defaults to 'shadow' when no manager is loaded.
- The boolean mission settings (rallyRepairVehicleOnRecovery) are read from mission.lastUserSettings, then from the game settings, then the default value true.
- The file contains many commented-out hooks (onRaceStarted, onRallyStageStart...): only those listed here are active.
- The co-driver pacing is adjusted in steps of 0.1 s (CodriverTiming.nudge) and shows a UI message (category 'rally').

**Dependencies (loaded first):** `gameplay_seatOccupants`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally.actionCodriverCallsEarlier()` | Input action: advances the co-driver's calls by 0.1 s (shifts the delay range) and shows a message. | 307 |
| `gameplay_rally.actionCodriverCallsLater()` | Input action: delays the co-driver's calls by 0.1 s and shows a message. | 311 |
| `gameplay_rally.actionRecceMoveVehicleBackward()` | Input action: if the recce is active, sends rallyInputActionRecceMoveVehicleBackward to the UI. | 266 |
| `gameplay_rally.actionRecceMoveVehicleForward()` | Input action: if the recce is active, sends rallyInputActionRecceMoveVehicleForward to the UI. | 261 |
| `gameplay_rally.actionToggleMouseLikeVehicle()` | Input action: toggles the mouse like a vehicle in the recce (if RecceApp is enabled). | 252 |
| `gameplay_rally.actionTranscribeRecordingCut()` | Input action: sends rallyInputActionCutRecording to the UI (cuts the transcription recording). | 257 |
| `gameplay_rally.canManageMission(owner)` | Indicates whether the given owner is allowed to manage the rally manager. | 79 |
| `gameplay_rally.enableRecceApp(val)` | Enables or disables the recce app (RecceApp.setEnabled). | 179 |
| `gameplay_rally.getDebugLogging()` | Indicates whether the rally debug logs are active. | 457 |
| `gameplay_rally.getErrorMsgForUser()` | Last user-facing error message (load failure). | 432 |
| `gameplay_rally.getRace()` | Race data recorded by the onRallyRegisterRace hook. | 498 |
| `gameplay_rally.getRallyManager()` | Current rally manager. | 430 |
| `gameplay_rally.getRallyManagerOwner()` | Owner of the current manager. | 431 |
| `gameplay_rally.getRallyToolbox()` | Debug toolbox object (nil until toggleDebug has been called). | 303 |
| `gameplay_rally.getRecoveryRepairVehicle()` | Indicates whether the vehicle must be repaired on recovery: asks the loop manager (gameplay_rallyLoop) if it exists, otherwise reads rallyRepairVehicleOnRecovery (mission setting, then game setting, default true). | 433 |
| `gameplay_rally.getStageObserverState()` | State of the manager's stage observer. | 452 |
| `gameplay_rally.getStageRuntimeAuthorityMode()` | Stage runtime authority mode of the manager, or 'shadow' without a manager. | 449 |
| `gameplay_rally.getUiColor()` | Current theme color: override if set, otherwise the loop manager's color (gameplay_rallyLoop), otherwise the standalone stream's, otherwise '#009a1a'. | 487 |
| `gameplay_rally.getUiColorOverride()` | Color override set by setUiColor. | 490 |
| `gameplay_rally.isRallyToolboxVisible()` | Indicates whether the Rally Toolbox window is open. | 496 |
| `gameplay_rally.isReady()` | Indicates whether a rally manager is loaded. | 171 |
| `gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options)` | Creates a RallyManager for the mission folder, sets the voicepack, rebuilds the assets and, on success, installs it and places the co-driver. Does not replace the old manager on failure. | 130 |
| `gameplay_rally.onExtensionLoaded()` | Load hook: loads ExtHelper and sends rally.onExtensionLoaded to the UI. *(internal)* *(hook)* | 233 |
| `gameplay_rally.onExtensionUnloaded()` | Unload hook: removes the dummy co-driver and unloads ExtHelper. *(internal)* *(hook)* | 240 |
| `gameplay_rally.onRacePathnodeReached(event)` | Race hook: records a split time (recordSplit) for the pathnode reached; logs a warning if event.pathnode is missing. *(internal)* *(hook)* | 320 |
| `gameplay_rally.onRallyRegisterRace(raceData)` | Hook: stores the race data and passes it to the manager (setRaceData). *(internal)* *(hook)* | 380 |
| `gameplay_rally.onRallyVehicleRecovery(recoveryType)` | Hook: adds the recovery time to the manager (addRecoveryRaceTime). *(internal)* *(hook)* | 388 |
| `gameplay_rally.onSeatOccupantEnter()` | Seat hook: replaces the dummy co-driver (alias of the internal function seatCodriver). *(internal)* *(hook)* | 111 |
| `gameplay_rally.onSeatOccupantExit()` | Seat hook: replaces the dummy co-driver after an occupant leaves (the seat system removes dummy occupants on configuration respawns). *(internal)* *(hook)* | 111 |
| `gameplay_rally.onSettingsChanged()` | Settings change hook: notifies the rally manager. *(internal)* *(hook)* | 417 |
| `gameplay_rally.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: updates RecceApp and the rally manager (except during the recce recording) and draws the Rally Toolbox if visible. *(internal)* *(hook)* | 183 |
| `gameplay_rally.onVehicleResetted(vehicleID)` | Hook: when player 0's vehicle is reset, notifies the rally manager. *(internal)* *(hook)* | 210 |
| `gameplay_rally.setDebugLogging(val)` | Enables or disables the rally debug logs. | 458 |
| `gameplay_rally.setStageRuntimeAuthorityMode(mode)` | Passes the stage runtime authority mode to the manager. | 444 |
| `gameplay_rally.setUiColor(hex)` | Overrides the theme color of the Stage Timing / Progress streams. nil or an empty string clears the override. | 484 |
| `gameplay_rally.toggleDebug()` | Shows or hides the "Rally Toolbox" ImGui window (created on the first call). | 291 |
| `gameplay_rally.unloadMission(options)` | Unloads the rally manager if the owner matches. | 156 |

### Parameter details

#### `gameplay_rally.canManageMission(owner)`

Indicates whether the given owner is allowed to manage the rally manager.

- `owner` (*string|nil*) : 'mission', 'recce' or 'external' (default).
- **returns**: boolean true if allowed.
- **returns**: string|nil Reason for the refusal.

#### `gameplay_rally.enableRecceApp(val)`

Enables or disables the recce app (RecceApp.setEnabled).

- `val` (*boolean*) : true to enable.

#### `gameplay_rally.getDebugLogging()`

Indicates whether the rally debug logs are active.

- **returns**: boolean true if active.

#### `gameplay_rally.getErrorMsgForUser()`

Last user-facing error message (load failure).

- **returns**: string|nil Message.

#### `gameplay_rally.getRace()`

Race data recorded by the onRallyRegisterRace hook.

- **returns**: table|nil raceData.

#### `gameplay_rally.getRallyManager()`

Current rally manager.

- **returns**: table|nil RallyManager or nil.

#### `gameplay_rally.getRallyManagerOwner()`

Owner of the current manager.

- **returns**: string|nil 'mission', 'recce', 'external' or nil.

#### `gameplay_rally.getRallyToolbox()`

Debug toolbox object (nil until toggleDebug has been called).

- **returns**: table|nil RallyToolbox.

#### `gameplay_rally.getRecoveryRepairVehicle()`

Indicates whether the vehicle must be repaired on recovery: asks the loop manager (gameplay_rallyLoop) if it exists, otherwise reads rallyRepairVehicleOnRecovery (mission setting, then game setting, default true).

- **returns**: boolean true if repair.

#### `gameplay_rally.getStageObserverState()`

State of the manager's stage observer.

- **returns**: table|nil State, nil without a manager.

#### `gameplay_rally.getStageRuntimeAuthorityMode()`

Stage runtime authority mode of the manager, or 'shadow' without a manager.

- **returns**: string Mode.

#### `gameplay_rally.getUiColor()`

Current theme color: override if set, otherwise the loop manager's color (gameplay_rallyLoop), otherwise the standalone stream's, otherwise '#009a1a'.

- **returns**: string Hexadecimal color.

#### `gameplay_rally.getUiColorOverride()`

Color override set by setUiColor.

- **returns**: string|nil Color or nil.

#### `gameplay_rally.isRallyToolboxVisible()`

Indicates whether the Rally Toolbox window is open.

- **returns**: boolean true if visible.

#### `gameplay_rally.isReady()`

Indicates whether a rally manager is loaded.

- **returns**: boolean true if loaded.

#### `gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options)`

Creates a RallyManager for the mission folder, sets the voicepack, rebuilds the assets and, on success, installs it and places the co-driver. Does not replace the old manager on failure.

- `missionId` (*string*) : Mission id.
- `missionDir` (*string*) : Rally mission folder.
- `drivelineMode` (*any*) : Not used (commented-out code).
- `voicepackPick` (*any*) : Voicepack; nil = choice read from the mission's user settings (rallyVoicepackPick).
- `options` (*table|nil*) : owner: 'mission', 'recce' or 'external'.
- **returns**: boolean true if loaded.
- **returns**: string|nil Error message on failure.

#### `gameplay_rally.onRacePathnodeReached(event)`

Race hook: records a split time (recordSplit) for the pathnode reached; logs a warning if event.pathnode is missing.

- `event` (*table*) : {pathnode, time, race}

#### `gameplay_rally.onRallyRegisterRace(raceData)`

Hook: stores the race data and passes it to the manager (setRaceData).

- `raceData` (*table*) : Race data.

#### `gameplay_rally.onRallyVehicleRecovery(recoveryType)`

Hook: adds the recovery time to the manager (addRecoveryRaceTime).

- `recoveryType` (*string*) : Recovery type.

#### `gameplay_rally.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: updates RecceApp and the rally manager (except during the recce recording) and draws the Rally Toolbox if visible.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_rally.onVehicleResetted(vehicleID)`

Hook: when player 0's vehicle is reset, notifies the rally manager.

- `vehicleID` (*integer*) : Vehicle reset.

#### `gameplay_rally.setDebugLogging(val)`

Enables or disables the rally debug logs.

- `val` (*boolean*) : New state.

#### `gameplay_rally.setStageRuntimeAuthorityMode(mode)`

Passes the stage runtime authority mode to the manager.

- `mode` (*string*) : Mode (default value 'shadow'; other values defined by the manager).

#### `gameplay_rally.setUiColor(hex)`

Overrides the theme color of the Stage Timing / Progress streams. nil or an empty string clears the override.

- `hex` (*string|nil*) : Hexadecimal color, e.g. '#ff0000'.

#### `gameplay_rally.unloadMission(options)`

Unloads the rally manager if the owner matches.

- `options` (*table|nil*) : owner (default 'external').
- **returns**: boolean true if unloaded.
- **returns**: string|nil Reason for the refusal.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'gameplay_seatOccupants'}, extension loaded beforehand. |
| `recceApp` | table | RecceApp module (rally recce app) exposed as is. |

**UI events (guihooks.trigger):** `Message`, `rally.onExtensionLoaded`, `rallyInputActionCutRecording`, `rallyInputActionRecceMoveVehicleBackward`, `rallyInputActionRecceMoveVehicleForward`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally.lua`.*
