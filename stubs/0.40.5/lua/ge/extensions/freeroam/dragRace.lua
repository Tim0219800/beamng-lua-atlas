---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/dragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quarter-mile dragster race against an AI ("drag_opponent") on the dragstrips of the gridmap_v2 and west_coast_usa levels. Handles the starting tree (pre-stage, stage, amber, green, red lights), setting up the AI opponent (positions, pre-stage/stage/start, nitro/JATO), aligning the player on the line, false start detection, timing up to the finish trigger, the 7-segment displays (time and speed) and the UI results screen. Relies on named scene objects (Prestagelight_l, Amberlight1_R, display_time_1_l, dragTrigger, startTrigger_L...) and on the level's BeamNGTriggers. Global: freeroam_dragRace.
--- Access: extension `freeroam_dragRace`: `extensions.load("freeroam_dragRace")`, then the global `freeroam_dragRace`
---@class freeroam_dragRace
freeroam_dragRace = {}

--- Called by the "Accept/Configure" button of the dragstrip dialog: opens the overview screen (displayOverview(true, false)) which puts the simulation in slow motion (1/100) and navigates to menu.dragRaceOverview.
---Source: lua/ge/extensions/freeroam/dragRace.lua:728
function freeroam_dragRace.accept() end

--- Closes the overview: puts the simulation back to 1x, the FOV to 65 and restores the previous camera.
---Source: lua/ge/extensions/freeroam/dragRace.lua:298
function freeroam_dragRace.closeOverview() end

--- Reads or sets the use of the cinematic (external) camera during the race.
---Source: lua/ge/extensions/freeroam/dragRace.lua:808
---@param value boolean|nil New value; nil to only read.
---@return boolean  Current value.
function freeroam_dragRace.enableCinematicCam(value) end

--- Reads or sets the "pro" tree (2 s countdown then the 3 ambers at 0.4 s then green) instead of the classic tree (successive ambers at 1.0/1.5/2.0 s, green at 2.5 s).
---Source: lua/ge/extensions/freeroam/dragRace.lua:815
---@param val boolean|nil New value; nil to only read.
---@return boolean  Current value.
function freeroam_dragRace.enableProTree(val) end

--- Quits the race: hides the menu, closes the dialog and the overview, deletes the drag_opponent scene object, forgets the opponent and reinitializes the module (onExtensionLoaded).
---Source: lua/ge/extensions/freeroam/dragRace.lua:732
function freeroam_dragRace.exit() end

--- Level trigger hook: entry/exit dialog (dragTrigger), finish (endTrigger: update of the displays and results, AI stop), opponent's lane (laneTrigger_L), vehicle registration (startTrigger_R/L) and preparation (dragTrigger_L).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:620
---@param data table {triggerName, event ('enter'|'exit'), subjectID}
function freeroam_dragRace.onBeamNGTrigger(data) end

--- End-of-level hook: empties the references to lights, displays, vehicles, triggers and results.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:867
function freeroam_dragRace.onClientEndMission() end

--- Load hook: finds the scene's lights, displays (display_time_i_l/r, display_speed_i_l/r, i = 1..5) and triggers, hides the displays and sets the reset positions according to the level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:742
function freeroam_dragRace.onExtensionLoaded() end

--- Unload hook: hides the menu, closes dialog and overview, deletes drag_opponent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:859
function freeroam_dragRace.onExtensionUnloaded() end

--- Pre-render hook, heart of the race: advances the countdown (starttimer in simulated time), the timer, the player alignment messages (distance to the line in m), the false start and the AI's pre-stage/stage/start phases.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:333
---@param dtReal number Real duration (s).
---@param dtSim number Simulated duration (s), used for the timers.
---@param dtRaw number Raw duration (s).
function freeroam_dragRace.onPreRender(dtReal, dtSim, dtRaw) end

--- Exported but nil (no local onUpdate function defined). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:dyn
function freeroam_dragRace.onUpdate() end

--- Vehicle deletion hook: forgets the player or the opponent and hides the lights.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:550
---@param id integer Vehicle id.
function freeroam_dragRace.onVehicleDestroyed(id) end

--- Vehicle reset hook: closes the dialog if it is the player in the trigger; repositions the opponent (setupVehicle) if it is drag_opponent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:791
---@param vid integer Vehicle id.
function freeroam_dragRace.onVehicleResetted(vid) end

--- Spawn hook: if it is the opponent, hides the menu and places it (setupVehicle); also finds the player vehicle named "thePlayer".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:541
---@param vehicleID integer Vehicle id.
function freeroam_dragRace.onVehicleSpawned(vehicleID) end

--- Hides all the light objects of the starting tree.
---Source: lua/ge/extensions/freeroam/dragRace.lua:107
function freeroam_dragRace.resetLights() end

--- Restarts: resets the opponent and the player, returns to the menu, simulation at normal speed, orbit camera.
---Source: lua/ge/extensions/freeroam/dragRace.lua:717
function freeroam_dragRace.restartRace() end

--- Chooses and spawns the opponent (core_vehicles.spawnNewVehicle with vehicleName 'drag_opponent', plate '2slow'), resets the race and the displays, and puts the player back on the starting line if needed.
---Source: lua/ge/extensions/freeroam/dragRace.lua:822
---@param selection table {model, config, color} (e.g. an element of selectRandomOpponent).
function freeroam_dragRace.selectOpponent(selection) end

--- Randomly picks a car or truck config; with sameClass=true, restricts to configs whose 0-100 km/h is within ±1 s of the player vehicle's. Adds the model's Brand and Country for the UI.
---Source: lua/ge/extensions/freeroam/dragRace.lua:562
---@param sameClass boolean|nil true for a similar performance class.
---@return table  Vehicle config entry (model_key, key, Brand, Country...).
function freeroam_dragRace.selectRandomOpponent(sameClass) end

--- Chooses the level for which the positions and cameras are hardcoded (gridmap_v2 or west_coast_usa) and reinitializes the module.
---Source: lua/ge/extensions/freeroam/dragRace.lua:878
---@param lvl string Level name.
function freeroam_dragRace.setLevel(lvl) end

--- Turns on the AI's pre-stage and makes the opponent advance or hold depending on whether the player is ready; see the bug (queLuaComuemand) in the notes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:158
function freeroam_dragRace.setupPrestage() end

--- Turns on the AI's stage light and makes it approach the line (speed 5, aggression 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/dragRace.lua:179
function freeroam_dragRace.setupStage() end

--- Exported but nil: no implementation in this file (see notes). (dynamically assigned)
---Source: lua/ge/extensions/freeroam/dragRace.lua:dyn
function freeroam_dragRace.startRace() end

