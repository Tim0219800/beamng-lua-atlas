# `gameplay_rally_recceApp`

*File: `lua/ge/extensions/gameplay/rally/recceApp.lua` · VM: Game Engine (GE) · 775 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_recceApp`: `extensions.load("gameplay_rally_recceApp")`, then the global `gameplay_rally_recceApp`

The rally "Recce" app in freeroam: lets you load a rally mission (rallyStage, rallyStageLoop or rallyRoadSection of the current level), display the upcoming pacenotes, teleport the vehicle along the pacenotes, to the start or to the mission trigger, and record a recce (vehicle driveline and voice "cuts"). Also provides a "Recce Toolbox" imgui window drawn in onUpdate. Relies on gameplay_rally (loadMission, getRallyManager, canManageMission), RecceSettings, VehicleCapture and CutCapture. Does nothing in onUpdate until setEnabled(true) has been called.

## Example

```lua
extensions.load('gameplay_rally_recceApp')
gameplay_rally_recceApp.openWindow()
-- then, in the window or in Lua:
gameplay_rally_recceApp.recordDrivelineStart(false)
gameplay_rally_recceApp.recordDrivelineCut()
gameplay_rally_recceApp.recordDrivelineStop()
```

## Notes

- The recordings (VehicleCapture / CutCapture) are only created if the game state is "freeroam" and the rally manager has a mission folder; otherwise vehicleCapture and cutCapture stay nil.
- Potential bug: recordDrivelineClearAll calls vehicleCapture:truncateCapturesFile() without testing that initCaptures actually created the captures; outside freeroam or without a loaded mission, this raises an error on nil.
- recordDrivelineCut only transcribes the voice if recordVoice was passed as true to recordDrivelineStart; if extensions.gameplay_rally_client.transcribe_recording_cut fails, the UI hook rallyInputActionDesktopCallNotOk receives the client message.
- moveVehicleToPacenoteV2 (used by moveVehicleForward/Backward) looks for the closest corner start via a kd-tree; if the vehicle is less than 12 m (10 + 2) from a pacenote, it goes to the next or the previous one, otherwise to the closest. It places the vehicle 10 m before the pacenote on the driveline.
- The code contains a commented-out block of code (idea of an all-imgui app) with no effect.
- UI events emitted: rally.recceApp.missionLoaded (success, error message), rally.recceApp.refreshed (list of missions, last state), rallyInputActionDesktopCallNotOk.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_recceApp.closeWindow()` | Closes the imgui window (without disabling the app). | 522 |
| `gameplay_rally_recceApp.isEnabled()` | Indicates whether the app is enabled. | 80 |
| `gameplay_rally_recceApp.isRecording()` | Indicates whether a driveline recording is in progress. | 764 |
| `gameplay_rally_recceApp.isWindowVisible()` | Indicates whether the imgui window is open. | 770 |
| `gameplay_rally_recceApp.loadMission(missionId, missionDir)` | Loads a mission via gameplay_rally.loadMission (owner 'recce'), builds the kd-tree index of the notebook's corner starts, stores the mission and the load state, then sends rally.recceApp.missionLoaded. | 113 |
| `gameplay_rally_recceApp.moveVehicleBackward()` | Teleports the player vehicle to the previous pacenote (or the closest if far from any pacenote), then resyncs the rally manager. | 301 |
| `gameplay_rally_recceApp.moveVehicleForward()` | Teleports the player vehicle to the next pacenote (or the closest if far from any pacenote), then resyncs the rally manager. | 297 |
| `gameplay_rally_recceApp.moveVehicleToMission()` | Teleports the player vehicle to the mission's start trigger (pos, rot), then resyncs the rally manager. | 305 |
| `gameplay_rally_recceApp.moveVehicleToStart()` | Teleports the player vehicle to the race path's default start position (orientation flipped by 180°), then resyncs the rally manager. | 212 |
| `gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw)` | Extension hook called every frame: if the app is enabled, draws the pacenotes (or the short route), the imgui window if open, and captures the vehicle position during driveline recording. *(internal)* *(hook)* | 329 |
| `gameplay_rally_recceApp.openWindow()` | Enables the app, opens the "Recce Toolbox" imgui window and refreshes the mission list. | 516 |
| `gameplay_rally_recceApp.recordDrivelineClearAll()` | Clears the mission's recording files: driveline, cuts and transcripts (file truncation). | 397 |
| `gameplay_rally_recceApp.recordDrivelineCut()` | Records a cut at the vehicle's current position (CutCapture) and, if voice recording is enabled, requests the transcription from the rally client. | 354 |
| `gameplay_rally_recceApp.recordDrivelineStart(recordVoice)` | Starts the driveline recording: initializes the captures (recce folders created if needed) and enables per-frame capture. | 372 |
| `gameplay_rally_recceApp.recordDrivelineStop()` | Stops the recording: writes the vehicle captures to disk then forgets the captures. | 382 |
| `gameplay_rally_recceApp.release()` | Disables the app, closes the window, forgets the captures and unloads the mission if it belongs to 'recce'. | 178 |
| `gameplay_rally_recceApp.reload(rallyExt)` | Reloads the RecceSettings, rebuilds the level's list of rally missions and sends the UI hook rally.recceApp.refreshed with {missions, last_mission_id, last_load_state, can_auto_load, corner_angles_style}. | 492 |
| `gameplay_rally_recceApp.setEnabled(val)` | Enables or disables the app; onUpdate does nothing if it is disabled. | 76 |
| `gameplay_rally_recceApp.setLastLoadState(state)` | Stores in the settings the last load state (true/false) for the current level. | 107 |
| `gameplay_rally_recceApp.setLastMissionId(mid)` | Stores in the settings the last mission id for the current level. | 101 |
| `gameplay_rally_recceApp.setShowNotes(val)` | Enables or disables the display of the next pacenotes while driving (outside the active editor and when the rally toolbox is not visible). | 342 |
| `gameplay_rally_recceApp.toggleDebug()` | Toggles gameplay_rally's debug mode (gameplay_rally.toggleDebug). | 416 |
| `gameplay_rally_recceApp.toggleMouseLikeVehicle()` | Toggles the rally toolbox's move-vehicle-with-mouse checkbox, if it exists. | 633 |
| `gameplay_rally_recceApp.toggleWindow()` | Opens the window if it is closed, closes it otherwise. | 526 |
| `gameplay_rally_recceApp.unloadMission()` | Unloads the mission of the 'recce' owner and stores the load state as false. | 167 |

### Parameter details

#### `gameplay_rally_recceApp.isEnabled()`

Indicates whether the app is enabled.

- **returns**: boolean enabled state

#### `gameplay_rally_recceApp.isRecording()`

Indicates whether a driveline recording is in progress.

- **returns**: boolean true during recording

#### `gameplay_rally_recceApp.isWindowVisible()`

Indicates whether the imgui window is open.

- **returns**: boolean true if open

#### `gameplay_rally_recceApp.loadMission(missionId, missionDir)`

Loads a mission via gameplay_rally.loadMission (owner 'recce'), builds the kd-tree index of the notebook's corner starts, stores the mission and the load state, then sends rally.recceApp.missionLoaded.

- `missionId` (*string*) : Mission identifier
- `missionDir` (*string*) : Mission folder
- **returns**: boolean true if the mission is loaded
- **returns**: string|nil Error message on failure

#### `gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw)`

Extension hook called every frame: if the app is enabled, draws the pacenotes (or the short route), the imgui window if open, and captures the vehicle position during driveline recording.

- `dtReal` (*number*) : Real time elapsed (s)
- `dtSim` (*number*) : Simulation time elapsed (s)
- `dtRaw` (*number*) : Raw time elapsed (s)

#### `gameplay_rally_recceApp.recordDrivelineStart(recordVoice)`

Starts the driveline recording: initializes the captures (recce folders created if needed) and enables per-frame capture.

- `recordVoice` (*boolean*) : true to also transcribe the voice at each cut

#### `gameplay_rally_recceApp.reload(rallyExt)`

Reloads the RecceSettings, rebuilds the level's list of rally missions and sends the UI hook rally.recceApp.refreshed with {missions, last_mission_id, last_load_state, can_auto_load, corner_angles_style}.

- `rallyExt` (*any*) : Not used in the function body

#### `gameplay_rally_recceApp.setEnabled(val)`

Enables or disables the app; onUpdate does nothing if it is disabled.

- `val` (*boolean*) : true to enable

#### `gameplay_rally_recceApp.setLastLoadState(state)`

Stores in the settings the last load state (true/false) for the current level.

- `state` (*boolean*) : true if a mission was loaded

#### `gameplay_rally_recceApp.setLastMissionId(mid)`

Stores in the settings the last mission id for the current level.

- `mid` (*string*) : Mission identifier

#### `gameplay_rally_recceApp.setShowNotes(val)`

Enables or disables the display of the next pacenotes while driving (outside the active editor and when the rally toolbox is not visible).

- `val` (*boolean*) : true to show

#### `gameplay_rally_recceApp.unloadMission()`

Unloads the mission of the 'recce' owner and stores the load state as false.

- **returns**: boolean false if the unload is refused
- **returns**: string|nil Error message on refusal

**UI events (guihooks.trigger):** `rally.recceApp.missionLoaded`, `rally.recceApp.refreshed`, `rallyInputActionDesktopCallNotOk`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/recceApp.lua`.*
