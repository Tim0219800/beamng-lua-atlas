# `gameplay_multiseat_gamemodeManager`

*File: `lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua` · VM: Game Engine (GE) · 722 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_multiseat_gamemodeManager`: `extensions.load("gameplay_multiseat_gamemodeManager")`, then the global `gameplay_multiseat_gamemodeManager`

Manager of multiseat game modes (split screen). It loads the gameplay/discover/multiseat/*Rules.lua providers, collects their info via the onGetMultiseatGamemodeInfos hook, starts/stops/restarts a mode, handles the fade, the blocking of input actions, the waiting for vehicles, and the start and end screens (via ui_router and mission.control). A modder adding a multiseat mode goes through it: it calls ext.start(settings), ext.onReady(vehicles), ext.stop(), buildStartScreen, buildEndScreen.

## Example

```lua
gameplay_multiseat_gamemodeManager.start('monMode', nil, {withFade = false})
-- from the mode: gameplay_multiseat_gamemodeManager.showEndScreen({winnerPlayer = 0})
```

## Notes

- gamemodePhase phases: nil, 'starting', 'waiting', 'running'.
- start() fails (false) if the mode is unknown, has no extensionPath, or if more players than playerCount.max have joined.
- Switching vehicles in the 'running' phase (outside synchronization) restarts the mode; the vehicleSwitching and walkingMode actions always stay blocked, the others only if the restrictScenarios setting is active.
- startScreenPendingOnPauseExit is never set to true in this file: playPendingRound therefore always returns false and isStartScreenPending always false.
- After VEHICLE_READY_TIMEOUT (5 s), the mode continues even if the vehicles are not ready.
- Fade duration: 0.35 s (FADE_DURATION).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_multiseat_gamemodeManager.deferReady()` | Moves the phase from 'starting' to 'waiting': the mode announces that it will itself notify when it is ready with notifyReady. | 372 |
| `gameplay_multiseat_gamemodeManager.getGamemodeId()` | Name of the current mode. | 503 |
| `gameplay_multiseat_gamemodeManager.getMaxPlayers()` | Maximum number of players of the current mode (info.playerCount.max). | 507 |
| `gameplay_multiseat_gamemodeManager.getPhase()` | Current phase of the mode. | 512 |
| `gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex)` | Display name of the local player with the given index, based on the joined participant's persona. | 128 |
| `gameplay_multiseat_gamemodeManager.getVehiclePool()` | Returns info.vehiclePool of the current mode. | 394 |
| `gameplay_multiseat_gamemodeManager.goToMainMenu()` | Returns to the main menu (returnToMainMenu). | 319 |
| `gameplay_multiseat_gamemodeManager.isActive()` | Indicates whether a mode is running. | 499 |
| `gameplay_multiseat_gamemodeManager.isStartScreenPending()` | Indicates whether the start screen is waiting for the pause to end (the variable is never set to true in this file). | 516 |
| `gameplay_multiseat_gamemodeManager.notifyReady()` | Moves to the 'running' phase, ends the fade if active and runs the callback set by setReadyCallback. Has no effect outside the 'starting'/'waiting' phases. | 378 |
| `gameplay_multiseat_gamemodeManager.onAfterRouteChange(context)` | Hook after a UI route change: if a start screen is pending and the target route is 'play' or 'multiseat', plays it. *(internal)* *(hook)* | 591 |
| `gameplay_multiseat_gamemodeManager.onClientEndMission()` | End-of-level hook: stops the mode without reactivating freeroam. *(internal)* *(hook)* | 686 |
| `gameplay_multiseat_gamemodeManager.onExtensionUnloaded()` | Unload hook: unblocks the actions, calls ext.stop() and resets all state, including the mode registry. *(internal)* *(hook)* | 599 |
| `gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive)` | Hook: adds the active screen mode to the screensActive list. *(internal)* *(hook)* | 581 |
| `gameplay_multiseat_gamemodeManager.onLoadingScreenFadeout()` | Empty hook: the "vehicles ready" flow of onPreRender already handles the transition. *(internal)* *(hook)* | 587 |
| `gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button)` | Hook: runs the callback of the clicked button (mgrId 'multiseatGamemode'). For the end screen, immediately; for the start screen, after returning to the multiseat route, onUIStartButtonClicked and a 0.1 s delay. *(internal)* *(hook)* | 557 |
| `gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result)` | Hook after multiseat settings are applied: restarts the mode if changeSet.requiresRestart and if the application succeeded without exitAfterApply. *(internal)* *(hook)* | 681 |
| `gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)` | Multiseat pause menu build hook: adds the Game modes button if there is no active mode, otherwise Settings, Quit and Restart mode. *(internal)* *(hook)* | 624 |
| `gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim)` | Called every frame. In the 'waiting' phase with vehicles pending: waits for them to be ready (or the 5 s timeout), notifies ready, calls ext.onReady(vehicles), freezes the vehicles then shows the start screen. *(internal)* *(hook)* | 533 |
| `gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode)` | Hook: when the UI requests the mission screen data (mode not containing 'test'), returns the active screen via onRequestMissionScreenDataReady and emits onMissionScreenReady. *(internal)* *(hook)* | 550 |
| `gameplay_multiseat_gamemodeManager.onScreenFadeState(state)` | Screen fade hook: when state is 1 (black screen) and a launch is deferred, launches the mode. *(internal)* *(hook)* | 527 |
| `gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player)` | Vehicle switch hook: restarts the mode if in the 'running' phase and outside vehicle synchronization. *(internal)* *(hook)* | 675 |
| `gameplay_multiseat_gamemodeManager.playPendingRound()` | Shows the start screen if it was pending. | 520 |
| `gameplay_multiseat_gamemodeManager.requestGamemodeData()` | Sends the UI (guihooks OnGamemodeData, context 'multiseat') the list of available modes, the current mode, its settings and the list of players. Modes that are mapUnsupported or exceed the number of players are counted but not listed. | 144 |
| `gameplay_multiseat_gamemodeManager.restart(name, settings)` | Restarts the mode (the current one if name is nil) with fade. If the requested mode is not the active mode, calls start. | 481 |
| `gameplay_multiseat_gamemodeManager.setReadyCallback(callback)` | Sets a function called once, when the mode enters the 'running' phase (notifyReady). | 368 |
| `gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool()` | Indicates whether the start was requested with options.assignVehiclePool = true. | 399 |
| `gameplay_multiseat_gamemodeManager.showEndScreen(resultData)` | Shows the end screen: emits onMultiseatGamemodeFinished, pauses the simulation time, then builds the screen from resultData and the mode's buildEndScreen overrides (header, headerColor, body, layout, pages, buttons). By default: Replay, Freeroam, Main menu buttons. | 252 |
| `gameplay_multiseat_gamemodeManager.start(name, settings, options)` | Starts a mode: loads ui_multiseat_freeroam, stops the previous mode, loads the mode's extension (info.extensionPath), assigns it ext.info, stores the settings (info.settings defaults if nil), disables multiseat freeroam then launches the mode (with fade unless options.withFade == false). | 432 |
| `gameplay_multiseat_gamemodeManager.stop()` | Stops the current mode, calls ext.stop() and reactivates multiseat freeroam (ui_multiseat_freeroam.activate). | 364 |

### Parameter details

#### `gameplay_multiseat_gamemodeManager.getGamemodeId()`

Name of the current mode.

- **returns**: string|nil Name, or nil.

#### `gameplay_multiseat_gamemodeManager.getMaxPlayers()`

Maximum number of players of the current mode (info.playerCount.max).

- **returns**: integer|nil Maximum, or nil.

#### `gameplay_multiseat_gamemodeManager.getPhase()`

Current phase of the mode.

- **returns**: string|nil nil, 'starting', 'waiting' or 'running'.

#### `gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex)`

Display name of the local player with the given index, based on the joined participant's persona.

- `playerIndex` (*integer*) : Player index (0-based).
- **returns**: string|nil displayName, or nil if unknown.

#### `gameplay_multiseat_gamemodeManager.getVehiclePool()`

Returns info.vehiclePool of the current mode.

- **returns**: table|nil Vehicle pool declared by the mode.

#### `gameplay_multiseat_gamemodeManager.isActive()`

Indicates whether a mode is running.

- **returns**: boolean true if a mode is active.

#### `gameplay_multiseat_gamemodeManager.isStartScreenPending()`

Indicates whether the start screen is waiting for the pause to end (the variable is never set to true in this file).

- **returns**: boolean Always false in practice.

#### `gameplay_multiseat_gamemodeManager.onAfterRouteChange(context)`

Hook after a UI route change: if a start screen is pending and the target route is 'play' or 'multiseat', plays it.

- `context` (*table*) : Contains toRoute.name.

#### `gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive)`

Hook: adds the active screen mode to the screensActive list.

- `screensActive` (*string[]*) : List filled in place.

#### `gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button)`

Hook: runs the callback of the clicked button (mgrId 'multiseatGamemode'). For the end screen, immediately; for the start screen, after returning to the multiseat route, onUIStartButtonClicked and a 0.1 s delay.

- `button` (*table*) : Button with mgrId and funId.

#### `gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result)`

Hook after multiseat settings are applied: restarts the mode if changeSet.requiresRestart and if the application succeeded without exitAfterApply.

- `changeSet` (*table*) : Changes (requiresRestart).
- `result` (*table*) : Result (success, exitAfterApply).

#### `gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)`

Multiseat pause menu build hook: adds the Game modes button if there is no active mode, otherwise Settings, Quit and Restart mode.

- `actions` (*table[]*) : List of actions to complete.
- `context` (*table*) : Context (unused).
- `registerButton` (*function*) : Function that registers a button and its callback.

#### `gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim)`

Called every frame. In the 'waiting' phase with vehicles pending: waits for them to be ready (or the 5 s timeout), notifies ready, calls ext.onReady(vehicles), freezes the vehicles then shows the start screen.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode)`

Hook: when the UI requests the mission screen data (mode not containing 'test'), returns the active screen via onRequestMissionScreenDataReady and emits onMissionScreenReady.

- `mode` (*string*) : Requested screen mode.

#### `gameplay_multiseat_gamemodeManager.onScreenFadeState(state)`

Screen fade hook: when state is 1 (black screen) and a launch is deferred, launches the mode.

- `state` (*integer*) : Fade state; 1 = fully faded.

#### `gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player)`

Vehicle switch hook: restarts the mode if in the 'running' phase and outside vehicle synchronization.

- `oldId` (*integer*) : Old vehicle id.
- `newId` (*integer*) : New id.
- `player` (*integer*) : Player concerned.

#### `gameplay_multiseat_gamemodeManager.playPendingRound()`

Shows the start screen if it was pending.

- **returns**: boolean true if the screen was shown.

#### `gameplay_multiseat_gamemodeManager.restart(name, settings)`

Restarts the mode (the current one if name is nil) with fade. If the requested mode is not the active mode, calls start.

- `name` (*string|nil*) : Mode to restart.
- `settings` (*table|nil*) : New settings; nil = keep the current ones.
- **returns**: boolean false if there is no mode to restart.

#### `gameplay_multiseat_gamemodeManager.setReadyCallback(callback)`

Sets a function called once, when the mode enters the 'running' phase (notifyReady).

- `callback` (*function|nil*) : Function with no argument.

#### `gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool()`

Indicates whether the start was requested with options.assignVehiclePool = true.

- **returns**: boolean true if the pool must be assigned.

#### `gameplay_multiseat_gamemodeManager.showEndScreen(resultData)`

Shows the end screen: emits onMultiseatGamemodeFinished, pauses the simulation time, then builds the screen from resultData and the mode's buildEndScreen overrides (header, headerColor, body, layout, pages, buttons). By default: Replay, Freeroam, Main menu buttons.

- `resultData` (*table|nil*) : Fields read: title, tied, winnerPlayer (index), text.

#### `gameplay_multiseat_gamemodeManager.start(name, settings, options)`

Starts a mode: loads ui_multiseat_freeroam, stops the previous mode, loads the mode's extension (info.extensionPath), assigns it ext.info, stores the settings (info.settings defaults if nil), disables multiseat freeroam then launches the mode (with fade unless options.withFade == false).

- `name` (*string*) : Mode name in the registry.
- `settings` (*table|nil*) : Settings; nil = default values.
- `options` (*table|nil*) : withFade (boolean, false = no fade), assignVehiclePool (boolean).
- **returns**: boolean true if the launch is started, false on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `ModuleName` | string | Module name: 'gamemodeManager'. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGetMultiseatGamemodeInfos`
- `onMissionScreenReady` — listened to by 1 module(s)
- `onMultiseatGamemodeFinished` — listened to by 1 module(s)
- `onMultiseatGamemodeLaunched` — listened to by 1 module(s)
- `onMultiseatGamemodeStopped` — listened to by 1 module(s)
- `onStartScreenFinishedBuilding` — listened to by 1 module(s)
- `onUIStartButtonClicked` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `OnGamemodeData`, `onRequestMissionScreenDataReady`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

**Loads extensions:** `ui_multiseat_freeroam`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua`.*
