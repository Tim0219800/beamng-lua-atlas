# `gameplay_rallyLoop`

*File: `lua/ge/extensions/gameplay/rallyLoop.lua` · VM: Game Engine (GE) · 394 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rallyLoop`: `extensions.load("gameplay_rallyLoop")`, then the global `gameplay_rallyLoop`

Facade extension of the "rally loop" mode (chaining service, liaison, special stages). It owns the RallyLoopManager instance (loop/rallyLoopManager) created by setup(missionId, missionDir), relays the game's updates and hooks to it, and publishes the "rallyLoop" UI stream every frame via guihooks.queueStream. Without a manager, it publishes the StandaloneFallbackStream stream (`standaloneUiBridge` mode); getRuntimeMode returns 'rallyLoop', 'standaloneUiBridge' or 'idle'. It also hosts the "Loop Toolbox" debug imgui window.

## Example

```lua
gameplay_rallyLoop.setup(missionId, missionDir)
print(gameplay_rallyLoop.getRuntimeMode()) -- 'rallyLoop'
gameplay_rallyLoop.unload()
```

## Notes

- The UI stream's countdown is hidden (activeState replaced by inactive, countdownData removed) if the `rallyStartCountdownDisplay` setting is not '2d' and the 3D clock is available (or the setting is anything other than '3d').
- handleGOTO: the default branch calls rallyLoopManager:startNextMission() even if rallyLoopManager is nil, which causes an error in that case.
- For an 'abandon' of a mission in progress (onAnyMissionWillChange with state 'stopped' and abandoned), a DNF attempt is recorded unless the current mission is 'serviceOut'.
- Most getters return a neutral value (false, nil, 0) when no manager exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rallyLoop.addTestPenalty(amount)` | Records a test penalty in the manager (recordTestPenalty). | 324 |
| `gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels)` | Delegates the debug drawing to the manager. | 205 |
| `gameplay_rallyLoop.getDebugLogging()` | Debug log state. | 278 |
| `gameplay_rallyLoop.getDrawFlag(flagName)` | Reads a debug drawing flag of the manager. | 374 |
| `gameplay_rallyLoop.getLoopToolbox()` | Current LoopToolbox object. | 201 |
| `gameplay_rallyLoop.getManager()` | Current RallyLoopManager instance. | 368 |
| `gameplay_rallyLoop.getMissionExecutionTransferFlag()` | Reads the execution transfer flag. | 296 |
| `gameplay_rallyLoop.getNextMissionId()` | Id of the loop's next mission. | 303 |
| `gameplay_rallyLoop.getRuntimeMode()` | Current runtime mode. | 83 |
| `gameplay_rallyLoop.getSSRescheduleCount()` | Number of special stage (SS) reschedules of the manager. | 387 |
| `gameplay_rallyLoop.handleGOTO(gotoRallyLoop)` | Handles a navigation request from the UI: 'restart' restarts the loop, 'abandon' instantly returns to the loop, 'postServiceIn' and any other value start the next mission. | 331 |
| `gameplay_rallyLoop.isLoopToolboxVisible()` | Indicates whether the Loop Toolbox window is shown. | 283 |
| `gameplay_rallyLoop.isReady()` | Public API: true if a manager exists. | 75 |
| `gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned)` | Hook called before any mission state change. Removes the manager's traffic exclusion and records a DNF on abandon (except in serviceOut). *(internal)* *(hook)* | 351 |
| `gameplay_rallyLoop.onCreatedRallyGroundMarkerRoute()` | Hook called when the ground markers route is created; relayed to the manager. *(internal)* *(hook)* | 239 |
| `gameplay_rallyLoop.onExtensionLoaded()` | Load hook; only writes a log if debugLogging is active. *(internal)* *(hook)* | 161 |
| `gameplay_rallyLoop.onExtensionUnloaded()` | Unload hook: publishes a {activeState = inactive} stream and clears the fallback stream. *(internal)* *(hook)* | 169 |
| `gameplay_rallyLoop.onGameplayInteract()` | Gameplay interaction hook; calls manager:onRallyModeInteract(). *(internal)* *(hook)* | 219 |
| `gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook called on every GUI update; relayed to the manager. *(internal)* *(hook)* | 136 |
| `gameplay_rallyLoop.onRallyDataUpdated(data)` | Hook emitted when the rally data changes; relayed to the manager, otherwise to the fallback stream. *(internal)* *(hook)* | 211 |
| `gameplay_rallyLoop.onRallyRouteRecoveryComplete(data)` | Hook called when the route recovery is finished; relayed to the manager if it handles the hook. *(internal)* *(hook)* | 251 |
| `gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType)` | Hook called on a vehicle recovery; calls manager:trackRecovery. *(internal)* *(hook)* | 245 |
| `gameplay_rallyLoop.onRecalculatedRoute()` | Hook called when the route has been recomputed; relayed to the manager. *(internal)* *(hook)* | 233 |
| `gameplay_rallyLoop.onSettingsChanged()` | Hook called when the settings change; relayed to the manager (if it handles the hook) and to the fallback stream. *(internal)* *(hook)* | 185 |
| `gameplay_rallyLoop.onUIStartButtonClicked()` | Hook called when the UI start button is clicked; relayed to the manager. *(internal)* *(hook)* | 227 |
| `gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw)` | Extension hook called every frame. Updates the manager and publishes the 'rallyLoop' stream; also handles the Loop Toolbox window. *(internal)* *(hook)* | 101 |
| `gameplay_rallyLoop.setDebugLogging(val)` | Enables the debug log. | 279 |
| `gameplay_rallyLoop.setDrawFlag(flagName, value)` | Sets a debug drawing flag of the manager. | 381 |
| `gameplay_rallyLoop.setMissionExecutionTransferFlag(val)` | Sets the manager's mission execution transfer flag. | 291 |
| `gameplay_rallyLoop.setup(missionId, missionDir)` | Creates the RallyLoopManager for the mission and clears the fallback stream. | 64 |
| `gameplay_rallyLoop.setupForNewMission()` | Prepares the manager for the next mission (manager:setupForNewMission). | 285 |
| `gameplay_rallyLoop.skipLiaisonForTesting(options)` | Test helper: skips the liaison. | 317 |
| `gameplay_rallyLoop.startNextMission()` | Starts the loop's next mission. | 310 |
| `gameplay_rallyLoop.toggleDebug()` | Shows or hides the Loop Toolbox window. | 193 |
| `gameplay_rallyLoop.unload()` | Destroys the manager and clears the fallback stream. | 69 |

### Parameter details

#### `gameplay_rallyLoop.addTestPenalty(amount)`

Records a test penalty in the manager (recordTestPenalty).

- `amount` (*number*) : Penalty amount (unit inferred from code: time).
- **returns**: boolean|any Manager result, or false and 'no rally loop manager'.

#### `gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels)`

Delegates the debug drawing to the manager.

- `zOnTop` (*boolean*) : Draw in the foreground.
- `drawRoute` (*boolean*) : Draw the route.
- `drawLabels` (*boolean*) : Draw the labels.

#### `gameplay_rallyLoop.getDebugLogging()`

Debug log state.

- **returns**: boolean debugLogging.

#### `gameplay_rallyLoop.getDrawFlag(flagName)`

Reads a debug drawing flag of the manager.

- `flagName` (*string*) : Flag name.
- **returns**: boolean false without a manager.

#### `gameplay_rallyLoop.getLoopToolbox()`

Current LoopToolbox object.

- **returns**: table|nil Toolbox, nil if the window was never opened or is closed.

#### `gameplay_rallyLoop.getManager()`

Current RallyLoopManager instance.

- **returns**: table|nil Manager.

#### `gameplay_rallyLoop.getMissionExecutionTransferFlag()`

Reads the execution transfer flag.

- **returns**: boolean false without a manager.

#### `gameplay_rallyLoop.getNextMissionId()`

Id of the loop's next mission.

- **returns**: string|nil Id, nil without a manager.

#### `gameplay_rallyLoop.getRuntimeMode()`

Current runtime mode.

- **returns**: string 'rallyLoop', 'standaloneUiBridge' or 'idle'.

#### `gameplay_rallyLoop.getSSRescheduleCount()`

Number of special stage (SS) reschedules of the manager.

- **returns**: integer 0 without a manager.

#### `gameplay_rallyLoop.handleGOTO(gotoRallyLoop)`

Handles a navigation request from the UI: 'restart' restarts the loop, 'abandon' instantly returns to the loop, 'postServiceIn' and any other value start the next mission.

- `gotoRallyLoop` (*string*) : 'restart', 'abandon', 'postServiceIn' or other.

#### `gameplay_rallyLoop.isLoopToolboxVisible()`

Indicates whether the Loop Toolbox window is shown.

- **returns**: boolean Visibility.

#### `gameplay_rallyLoop.isReady()`

Public API: true if a manager exists.

- **returns**: boolean true after setup.

#### `gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned)`

Hook called before any mission state change. Removes the manager's traffic exclusion and records a DNF on abandon (except in serviceOut).

- `state` (*string*) : New mission state (e.g. 'stopped').
- `mission` (*table|nil*) : Mission concerned.
- `abandoned` (*boolean*) : true if the mission is abandoned.

#### `gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook called on every GUI update; relayed to the manager.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_rallyLoop.onRallyDataUpdated(data)`

Hook emitted when the rally data changes; relayed to the manager, otherwise to the fallback stream.

- `data` (*table*) : Rally data.

#### `gameplay_rallyLoop.onRallyRouteRecoveryComplete(data)`

Hook called when the route recovery is finished; relayed to the manager if it handles the hook.

- `data` (*table*) : Recovery data.

#### `gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType)`

Hook called on a vehicle recovery; calls manager:trackRecovery.

- `recoveryType` (*string*) : Recovery type.

#### `gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw)`

Extension hook called every frame. Updates the manager and publishes the 'rallyLoop' stream; also handles the Loop Toolbox window.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_rallyLoop.setDebugLogging(val)`

Enables the debug log.

- `val` (*boolean*) : New value.

#### `gameplay_rallyLoop.setDrawFlag(flagName, value)`

Sets a debug drawing flag of the manager.

- `flagName` (*string*) : Flag name.
- `value` (*boolean*) : Value.

#### `gameplay_rallyLoop.setMissionExecutionTransferFlag(val)`

Sets the manager's mission execution transfer flag.

- `val` (*boolean*) : Value.

#### `gameplay_rallyLoop.setup(missionId, missionDir)`

Creates the RallyLoopManager for the mission and clears the fallback stream.

- `missionId` (*string*) : Loop mission id.
- `missionDir` (*string*) : Mission folder.

#### `gameplay_rallyLoop.skipLiaisonForTesting(options)`

Test helper: skips the liaison.

- `options` (*table|nil*) : Options passed to the manager (inferred from code).
- **returns**: boolean Success.
- **returns**: string|nil 'no rally loop manager' without a manager.

#### `gameplay_rallyLoop.startNextMission()`

Starts the loop's next mission.

- **returns**: any Manager result (false without a manager).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rallyLoop.lua`.*
