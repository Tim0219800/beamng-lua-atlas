# `editor_scriptAIManager`

*File: `lua/ge/extensions/editor/scriptAIManager.lua` · VM: Game Engine (GE) · 593 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_scriptAIManager`: `extensions.load("editor_scriptAIManager")`, then the global `editor_scriptAIManager`

'Script AI Manager' window (Gameplay menu): records, replays and saves the driving of the scene's vehicles for level designers. For each vehicle, it drives the vehicle's ai module via queueLuaCommand (ai.startRecording, ai.stopRecording, ai.startFollowing, ai.stopFollowing, ai.scriptStop) and receives the recordings and the script state through hooks. It displays the state, the progress, a 3D plot of the recorded path and manages the *.track.json files.

## Example

```lua
local recs = extensions.editor_scriptAIManager.getCurrentRecordings()
for vehId, rec in pairs(recs) do print(vehId, #rec.path) end
```

## Notes

- Tracks are written to and read from /replays/scriptai/tracks/ with the .track.json extension; the file contains levelName, vehicle (JBeam), recording, version = 2, startDelay and timeOffset.
- Per-vehicle options ('More' menu): Loop (loopCount -1 or 1), Debug (plot), Start Offset (cuts X seconds at the start), Start Delay (delays the start); playback must be restarted after changing them.
- Fast forward: be:setPhysicsSpeedFactor(2) when checked, 0 when unchecked.
- On each onEditorGui frame, be:queueAllObjectLua asks all vehicles for ai.scriptState(); the reply arrives via onVehicleSubmitInfo.
- The path plot only displays points less than 100 to 200 m from the camera (bound between 100 and 200 depending on the distance to the focus point) and may cost performance.
- The commented-out persistence code (aiscript.json) is not active.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_scriptAIManager.getCurrentRecordings()` | Returns the table of in-memory recordings, keyed by vehicle id (each recording notably contains the path). | 576 |
| `editor_scriptAIManager.onDeserialized(data)` | Restore hook after a Lua reload: reinstalls recordings and vehState. *(internal)* *(hook)* | 561 |
| `editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw)` | Debug drawing hook: plots the recorded path of each vehicle as colored square prisms (if Display Path is checked and the window is visible), limited to points near the camera. *(internal)* *(hook)* | 464 |
| `editor_scriptAIManager.onEditorGui()` | Drawing hook called every frame: requests the script state of all vehicles and draws the table (name, state, progress, record/play/stop/save/load/More buttons) and the debug options (Fast forward, Display IDs, Display Path). *(internal)* *(hook)* | 130 |
| `editor_scriptAIManager.onEditorInitialized()` | Editor initialization hook: registers the window (640x200) and the 'Script AI Manager' menu entry (Gameplay group). *(internal)* *(hook)* | 571 |
| `editor_scriptAIManager.onSerialize()` | Serialization hook (Lua reload): returns {recordings, vehState}. *(internal)* *(hook)* | 557 |
| `editor_scriptAIManager.onVehicleSubmitInfo(vehId, data)` | Called by the vehicle (via extensions.hook) with ai.scriptState(): computes the percentage (time / endScriptTime), detects the sleeping state (time < startDelay) and the switch to 'idle' when the script is finished (data nil). *(internal)* *(hook)* | 515 |
| `editor_scriptAIManager.onVehicleSubmitRecording(vehId, data)` | Called by the vehicle (via extensions.hook) when a recording is finished: stores the data in recordings[vehId]. Do not call directly. *(internal)* *(hook)* | 509 |
| `editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player)` | Hook called when the player vehicle changes: updates the active vehicle in the list. *(internal)* *(hook)* | 567 |
| `editor_scriptAIManager.onWindowMenuItem()` | Called by the menu entry: finds the active player vehicle and displays the window. *(internal)* *(hook)* | 552 |

### Parameter details

#### `editor_scriptAIManager.getCurrentRecordings()`

Returns the table of in-memory recordings, keyed by vehicle id (each recording notably contains the path).

- **returns**: table<integer, table> Recordings by vehicle id.

#### `editor_scriptAIManager.onDeserialized(data)`

Restore hook after a Lua reload: reinstalls recordings and vehState.

- `data` (*table*) : Data returned by onSerialize.

#### `editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw)`

Debug drawing hook: plots the recorded path of each vehicle as colored square prisms (if Display Path is checked and the window is visible), limited to points near the camera.

- `lastDebugFocusPos` (*any*) : Not used: the code reads Lua.lastDebugFocusPos.
- `dtReal` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulation time delta.
- `dtRaw` (*number*) : Raw time delta.

#### `editor_scriptAIManager.onSerialize()`

Serialization hook (Lua reload): returns {recordings, vehState}.

- **returns**: table Data to restore.

#### `editor_scriptAIManager.onVehicleSubmitInfo(vehId, data)`

Called by the vehicle (via extensions.hook) with ai.scriptState(): computes the percentage (time / endScriptTime), detects the sleeping state (time < startDelay) and the switch to 'idle' when the script is finished (data nil).

- `vehId` (*integer*) : Vehicle id.
- `data` (*table|nil*) : Script state (status, time, scriptTime, endScriptTime, posError...) or nil if there is no script anymore.

#### `editor_scriptAIManager.onVehicleSubmitRecording(vehId, data)`

Called by the vehicle (via extensions.hook) when a recording is finished: stores the data in recordings[vehId]. Do not call directly.

- `vehId` (*integer*) : Vehicle id.
- `data` (*table*) : Recording returned by ai.stopRecording().

#### `editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player)`

Hook called when the player vehicle changes: updates the active vehicle in the list.

- `oldVehicle` (*integer*) : Old vehicle (inferred from code).
- `newVehicle` (*integer*) : New vehicle, id used to find the index.
- `player` (*integer*) : Player concerned.

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`, `queueAllObjectLua`, `setPhysicsSpeedFactor`
- `debugDrawer:` `drawLine`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/scriptAIManager.lua`.*
