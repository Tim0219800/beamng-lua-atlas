# `gameplay_drag_display`

*File: `lua/ge/extensions/gameplay/drag/display.lua` · VM: Game Engine (GE) · 1770 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_display`: `extensions.load("gameplay_drag_display")`, then the global `gameplay_drag_display`

Drag track display: starting tree (pre-stage lights, stage, three ambers, green, red, global blue, winner light, flashing driver light), timing/speed panels (5 digits per lane, time with 3 decimals, speed in mph with 2 decimals), flash messages, staging guide marker, and UI events (guihooks) for the tree app. It drives the scene objects named per lane (displayTime1..5, displaySpeed1..5, displayLight) and applies the states received from the network in multiplayer. Loaded on demand by gameplay_drag_core; a modder mostly uses it through the hooks and to turn lights on/off.

## Notes

- The panel digits are queued (queueDigitShape/applyPendingDigitShapes) because changing the shapeName reloads the mesh: doing everything on the arrival frame would freeze the game.
- The displayed speed comes from timers in m/s multiplied by 2.23694 (mph); the time is that of the important timer (importantTimerId, time_1_4 by default); nothing is displayed as long as this timer is 0.
- Two supported trees: treeType '.500' (default) and '.400', handled by handle500TreeLogic / handle400TreeLogic. In MP only the host drives the countdown lights; clients apply the received state (updateTreeLightsFromNetwork).
- The driver light flashes 6 times at 6 Hz after the winner light turns on.
- Amber/green sequence of the tree (lightStages): amber 1 at 1.0 s, amber 2 at 1.5 s, amber 3 at 2.0 s, green at 2.5 s (laneTimer time).
- Game option dragAssistStageGuideVisualizer: enables the staging guide marker (onPreRender).
- M.alwaysShowStageApp is true: the staging app stays visible even far from the line; if false, it is hidden beyond 10 m in freeroam.
- Multiseat: UI events are duplicated per player under the name multiseatDrag.<player>.<event>.
- The functions onBeforeDragUnloadAllExtensions and clearAll are the same function.

**Dependencies (loaded first):** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_display.broadcastTreeLightStaging(visible)` | Shows or hides the UI staging light (guihook updateTreeLightStaging), and repeats it for each multiseat player. | 117 |
| `gameplay_drag_display.clearAll()` | Turns off all the tree lights, hides the panel digits and the staging marker, cancels a flash in progress and resets the random seed. | 684 |
| `gameplay_drag_display.dragRaceEndLineReached(vehId)` | Finish line crossed: updates the panels (time and speed) of the racer's lane. | 1651 |
| `gameplay_drag_display.dragRaceVehicleStopped()` | Vehicle stopped after the race: sends updateTreeLightPhase=false to the UI. Does not clear the displayed results. | 1655 |
| `gameplay_drag_display.onBeforeDragUnloadAllExtensions()` | Hook emitted by core before unloading the drag extensions; does clearAll (same function). *(internal)* *(hook)* | 684 |
| `gameplay_drag_display.onDragClear(options)` | Full clear hook: empties the player caches, does clearAll then starts a "system reset" flash (lights and digits blink twice then stay off) from a track cache. *(internal)* *(hook)* | 1724 |
| `gameplay_drag_display.onDragDataSet(data)` | Hook emitted by core.setDragRaceData: builds the track's light tree and digits. In MP, does not trigger staging and keeps the digits of the previous round (only resets the lights); in solo does clearAll. *(internal)* *(hook)* | 1733 |
| `gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)` | MP hook: a timer from a remote driver arrived; updates their panels. *(internal)* *(hook)* | 1758 |
| `gameplay_drag_display.onDragReset(options)` | Reset hook: turns off the lights (but keeps the result digits), cancels a flash, resets the lane timers and the treeStarted/raceStartBroadcasted flags. *(internal)* *(hook)* | 1711 |
| `gameplay_drag_display.onExtensionLoaded()` | Load hook: init() then clearAll(). *(internal)* *(hook)* | 695 |
| `gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw)` | Pre-render hook: updates or clears the staging guide marker according to the dragAssistStageGuideVisualizer option. *(internal)* *(hook)* | 1350 |
| `gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: applies the pending digits, sends the deferred tree updates (MP), advances the current flash if any, checks the visibility of the staging app, advances each racer's countdown and the driver light blinking. *(internal)* *(hook)* | 1303 |
| `gameplay_drag_display.onWinnerLightOn(lane)` | Turns on the lane's winner light and makes its driver light flash. *(hook)* | 1365 |
| `gameplay_drag_display.preStageLightOff(vehId)` | Turns off the pre-stage light of the racer's lane and updates the UI. | 1472 |
| `gameplay_drag_display.preStageLightOn(vehId)` | Turns on the pre-stage light of the racer's lane, updates the UI and shows the flash message ui.drag.flash.preStage for a playable racer. | 1437 |
| `gameplay_drag_display.resetDragRaceValues()` | Resets the tree's lane timers (laneTimer, laneTimerFlag, dialOffset) and the treeStarted/raceStartBroadcasted flags of each racer. | 1681 |
| `gameplay_drag_display.setDisqualifiedLights(vehId)` | Turns off the ambers of the disqualified racer; if the reason is the false start (redLightReason), turns off the green and turns on the red. Clears the panels, emits startRaceFromTree and shows the reason as a flash message (5 s) for a playable racer. | 1597 |
| `gameplay_drag_display.stageLightOff(vehId)` | Turns off the stage light and the blue light, decrements the count of racers in stage and synchronizes the state (MP: drag.syncStageLightState). | 1537 |
| `gameplay_drag_display.stageLightOn(vehId)` | Turns on the racer's stage light; when all lanes are in stage, turns on the blue light. Updates the UI, synchronizes the state (MP) and shows ui.drag.flash.stage for a playable racer. | 1500 |
| `gameplay_drag_display.startDragCountdown(vehId, dial)` | Starts the tree countdown for a racer in phase 2 'countdown': emits onDragCountdownStarted, sets treeStarted to true and sets dialOffset (dial minus the time already elapsed since the MP start). | 1568 |
| `gameplay_drag_display.stoppingVehicleDrag(vehId)` | Shows the flash message missions.dragRace.gameplay.inLine (5 s) for a playable racer. | 1644 |
| `gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState)` | Applies to a lane the light state received from the network (countDownLights, stageLights): updates isOn, the scene objects, and the UI of the lane's player (and multiseat). Builds the tree if it does not exist yet. | 455 |

### Parameter details

#### `gameplay_drag_display.broadcastTreeLightStaging(visible)`

Shows or hides the UI staging light (guihook updateTreeLightStaging), and repeats it for each multiseat player.

- `visible` (*boolean*) : true to show.

#### `gameplay_drag_display.dragRaceEndLineReached(vehId)`

Finish line crossed: updates the panels (time and speed) of the racer's lane.

- `vehId` (*integer*) : Racer's vehicle ID.

#### `gameplay_drag_display.onDragClear(options)`

Full clear hook: empties the player caches, does clearAll then starts a "system reset" flash (lights and digits blink twice then stay off) from a track cache.

- `options` (*table*) : Clear options (unused).

#### `gameplay_drag_display.onDragDataSet(data)`

Hook emitted by core.setDragRaceData: builds the track's light tree and digits. In MP, does not trigger staging and keeps the digits of the previous round (only resets the lights); in solo does clearAll.

- `data` (*table*) : Armed track data.

#### `gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)`

MP hook: a timer from a remote driver arrived; updates their panels.

- `raceId` (*any*) : Race identifier.
- `mpPlayerId` (*any*) : MP player.
- `timerName` (*string*) : Timer name.
- `timerValue` (*number*) : Value.

#### `gameplay_drag_display.onDragReset(options)`

Reset hook: turns off the lights (but keeps the result digits), cancels a flash, resets the lane timers and the treeStarted/raceStartBroadcasted flags.

- `options` (*table*) : Options (raceId...), unused.

#### `gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw)`

Pre-render hook: updates or clears the staging guide marker according to the dragAssistStageGuideVisualizer option.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: applies the pending digits, sends the deferred tree updates (MP), advances the current flash if any, checks the visibility of the staging app, advances each racer's countdown and the driver light blinking.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `gameplay_drag_display.onWinnerLightOn(lane)`

Turns on the lane's winner light and makes its driver light flash.

- `lane` (*integer*) : Winning lane.

#### `gameplay_drag_display.preStageLightOff(vehId)`

Turns off the pre-stage light of the racer's lane and updates the UI.

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_display.preStageLightOn(vehId)`

Turns on the pre-stage light of the racer's lane, updates the UI and shows the flash message ui.drag.flash.preStage for a playable racer.

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_display.setDisqualifiedLights(vehId)`

Turns off the ambers of the disqualified racer; if the reason is the false start (redLightReason), turns off the green and turns on the red. Clears the panels, emits startRaceFromTree and shows the reason as a flash message (5 s) for a playable racer.

- `vehId` (*integer*) : ID of the disqualified vehicle.

#### `gameplay_drag_display.stageLightOff(vehId)`

Turns off the stage light and the blue light, decrements the count of racers in stage and synchronizes the state (MP: drag.syncStageLightState).

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_display.stageLightOn(vehId)`

Turns on the racer's stage light; when all lanes are in stage, turns on the blue light. Updates the UI, synchronizes the state (MP) and shows ui.drag.flash.stage for a playable racer.

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_display.startDragCountdown(vehId, dial)`

Starts the tree countdown for a racer in phase 2 'countdown': emits onDragCountdownStarted, sets treeStarted to true and sets dialOffset (dial minus the time already elapsed since the MP start).

- `vehId` (*integer*) : Vehicle ID.
- `dial` (*number*) : Delay before the start of the light sequence (s).

#### `gameplay_drag_display.stoppingVehicleDrag(vehId)`

Shows the flash message missions.dragRace.gameplay.inLine (5 s) for a playable racer.

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState)`

Applies to a lane the light state received from the network (countDownLights, stageLights): updates isOn, the scene objects, and the UI of the lane's player (and multiseat). Builds the tree if it does not exist yet.

- `lane` (*integer*) : Lane.
- `lightState` (*table*) : {countDownLights = {amberLight1..3, greenLight, redLight}, stageLights = {prestageLight, stageLight}}.

## Fields

| Field | Type | Description |
|---|---|---|
| `alwaysShowStageApp` | boolean | true by default: keeps the staging app visible regardless of the distance to the stage line. |
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_phaseHandlers. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDragCountdownStarted` — listened to by 1 module(s)
- `startRaceFromTree`

**UI events (guihooks.trigger):** `ScenarioFlashMessage`, `TopCenterAppsFlashMessage`, `updateTreeLightApp`, `updateTreeLightDistance`, `updateTreeLightPhase`, `updateTreeLightStaging`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/display.lua`.*
