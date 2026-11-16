---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Bracket race" race type: each driver announces a dial (target time) and wins by getting close to it without beating it. Loaded by gameplay_drag_core when dragType is 'bracketRace'. Every frame, onUpdate advances each local racer (updateRacer then the phaseHandlers phase function named like the phase: stage, countdown, race, stop, emergencyStop), then triggers the group phase changes according to the mode (solo, MP host, MP client). startActivity sets the start delays from the dials (setDialsData).
--- Access: extension `gameplay_drag_dragTypes_bracketRace`: `extensions.load("gameplay_drag_dragTypes_bracketRace")`, then the global `gameplay_drag_dragTypes_bracketRace`
---@class gameplay_drag_dragTypes_bracketRace
---@field dependencies string[] gameplay_drag_core, gameplay_drag_phaseHandlers.
gameplay_drag_dragTypes_bracketRace = {}

--- Builds the ranked list of results: each entry contains vehId, lane, time (important timer), dialDiff, dialNotSet, isPlayable, disqualified. Order: positive gaps ascending, then breakouts (absolute gap ascending), then disqualified/no dial (players first, then lane, then vehId).
---Source: lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:127
---@param dragData table Race data with racers.
---@return table[]  List of results, {} if no racers.
function gameplay_drag_dragTypes_bracketRace.generateWinData(dragData) end

--- Load hook: retrieves the references to core and phaseHandlers and resets the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:34
function gameplay_drag_dragTypes_bracketRace.onExtensionLoaded() end

--- Per-frame hook, active only when the activity is started: simulates the local racers, calls the function of their phase, changes phase when it is completed (without dependency), marks the race as finished and handles the grouped phase advancement according to solo/host/client.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:59
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw) end

--- Stops the activity (hasActivityStarted = false).
---Source: lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:40
function gameplay_drag_dragTypes_bracketRace.resetDragRace() end

--- Starts the activity: dragData.isStarted = true and computes each racer's start delays from the value of its dial timer (phaseHandlers.setDialsData). Called by core.startDragRaceActivity.
---Source: lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:44
function gameplay_drag_dragTypes_bracketRace.startActivity() end

