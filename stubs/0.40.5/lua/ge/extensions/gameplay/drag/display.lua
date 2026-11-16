---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drag track display: starting tree (pre-stage lights, stage, three ambers, green, red, global blue, winner light, flashing driver light), timing/speed panels (5 digits per lane, time with 3 decimals, speed in mph with 2 decimals), flash messages, staging guide marker, and UI events (guihooks) for the tree app. It drives the scene objects named per lane (displayTime1..5, displaySpeed1..5, displayLight) and applies the states received from the network in multiplayer. Loaded on demand by gameplay_drag_core; a modder mostly uses it through the hooks and to turn lights on/off.
--- Access: extension `gameplay_drag_display`: `extensions.load("gameplay_drag_display")`, then the global `gameplay_drag_display`
---@class gameplay_drag_display
---@field alwaysShowStageApp boolean true by default: keeps the staging app visible regardless of the distance to the stage line.
---@field dependencies string[] gameplay_drag_core, gameplay_drag_phaseHandlers.
gameplay_drag_display = {}

--- Shows or hides the UI staging light (guihook updateTreeLightStaging), and repeats it for each multiseat player.
---Source: lua/ge/extensions/gameplay/drag/display.lua:117
---@param visible boolean true to show.
function gameplay_drag_display.broadcastTreeLightStaging(visible) end

--- Turns off all the tree lights, hides the panel digits and the staging marker, cancels a flash in progress and resets the random seed.
---Source: lua/ge/extensions/gameplay/drag/display.lua:684
function gameplay_drag_display.clearAll() end

--- Finish line crossed: updates the panels (time and speed) of the racer's lane.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1651
---@param vehId integer Racer's vehicle ID.
function gameplay_drag_display.dragRaceEndLineReached(vehId) end

--- Vehicle stopped after the race: sends updateTreeLightPhase=false to the UI. Does not clear the displayed results.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1655
function gameplay_drag_display.dragRaceVehicleStopped() end

--- Hook emitted by core before unloading the drag extensions; does clearAll (same function).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:684
function gameplay_drag_display.onBeforeDragUnloadAllExtensions() end

--- Full clear hook: empties the player caches, does clearAll then starts a "system reset" flash (lights and digits blink twice then stay off) from a track cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:1724
---@param options table Clear options (unused).
function gameplay_drag_display.onDragClear(options) end

--- Hook emitted by core.setDragRaceData: builds the track's light tree and digits. In MP, does not trigger staging and keeps the digits of the previous round (only resets the lights); in solo does clearAll.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:1733
---@param data table Armed track data.
function gameplay_drag_display.onDragDataSet(data) end

--- MP hook: a timer from a remote driver arrived; updates their panels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:1758
---@param raceId any Race identifier.
---@param mpPlayerId any MP player.
---@param timerName string Timer name.
---@param timerValue number Value.
function gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue) end

--- Reset hook: turns off the lights (but keeps the result digits), cancels a flash, resets the lane timers and the treeStarted/raceStartBroadcasted flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:1711
---@param options table Options (raceId...), unused.
function gameplay_drag_display.onDragReset(options) end

--- Load hook: init() then clearAll().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:695
function gameplay_drag_display.onExtensionLoaded() end

--- Pre-render hook: updates or clears the staging guide marker according to the dragAssistStageGuideVisualizer option.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:1350
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw) end

--- Per-frame hook: applies the pending digits, sends the deferred tree updates (MP), advances the current flash if any, checks the visibility of the staging app, advances each racer's countdown and the driver light blinking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/display.lua:1303
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw) end

--- Turns on the lane's winner light and makes its driver light flash.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1365
---@param lane integer Winning lane.
function gameplay_drag_display.onWinnerLightOn(lane) end

--- Turns off the pre-stage light of the racer's lane and updates the UI.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1472
---@param vehId integer Vehicle ID.
function gameplay_drag_display.preStageLightOff(vehId) end

--- Turns on the pre-stage light of the racer's lane, updates the UI and shows the flash message ui.drag.flash.preStage for a playable racer.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1437
---@param vehId integer Vehicle ID.
function gameplay_drag_display.preStageLightOn(vehId) end

--- Resets the tree's lane timers (laneTimer, laneTimerFlag, dialOffset) and the treeStarted/raceStartBroadcasted flags of each racer.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1681
function gameplay_drag_display.resetDragRaceValues() end

--- Turns off the ambers of the disqualified racer; if the reason is the false start (redLightReason), turns off the green and turns on the red. Clears the panels, emits startRaceFromTree and shows the reason as a flash message (5 s) for a playable racer.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1597
---@param vehId integer ID of the disqualified vehicle.
function gameplay_drag_display.setDisqualifiedLights(vehId) end

--- Turns off the stage light and the blue light, decrements the count of racers in stage and synchronizes the state (MP: drag.syncStageLightState).
---Source: lua/ge/extensions/gameplay/drag/display.lua:1537
---@param vehId integer Vehicle ID.
function gameplay_drag_display.stageLightOff(vehId) end

--- Turns on the racer's stage light; when all lanes are in stage, turns on the blue light. Updates the UI, synchronizes the state (MP) and shows ui.drag.flash.stage for a playable racer.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1500
---@param vehId integer Vehicle ID.
function gameplay_drag_display.stageLightOn(vehId) end

--- Starts the tree countdown for a racer in phase 2 'countdown': emits onDragCountdownStarted, sets treeStarted to true and sets dialOffset (dial minus the time already elapsed since the MP start).
---Source: lua/ge/extensions/gameplay/drag/display.lua:1568
---@param vehId integer Vehicle ID.
---@param dial number Delay before the start of the light sequence (s).
function gameplay_drag_display.startDragCountdown(vehId, dial) end

--- Shows the flash message missions.dragRace.gameplay.inLine (5 s) for a playable racer.
---Source: lua/ge/extensions/gameplay/drag/display.lua:1644
---@param vehId integer Vehicle ID.
function gameplay_drag_display.stoppingVehicleDrag(vehId) end

--- Applies to a lane the light state received from the network (countDownLights, stageLights): updates isOn, the scene objects, and the UI of the lane's player (and multiseat). Builds the tree if it does not exist yet.
---Source: lua/ge/extensions/gameplay/drag/display.lua:455
---@param lane integer Lane.
---@param lightState table {countDownLights = {amberLight1..3, greenLight, redLight}, stageLights = {prestageLight, stageLight}}.
function gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState) end

