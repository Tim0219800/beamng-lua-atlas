---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Heads-up" race type: simultaneous start with no handicap, the best time of the important timer wins. Loaded by gameplay_drag_core when dragType is 'headsUpRace'. Every frame, onUpdate advances each local racer (updateRacer then the phaseHandlers phase function: stage, countdown, race, stop, emergencyStop) and triggers the group phase changes according to the mode (solo, MP host, MP client). startActivity sets all dials to 0.
--- Access: extension `gameplay_drag_dragTypes_headsUpRace`: `extensions.load("gameplay_drag_dragTypes_headsUpRace")`, then the global `gameplay_drag_dragTypes_headsUpRace`
---@class gameplay_drag_dragTypes_headsUpRace
---@field dependencies string[] gameplay_drag_core, gameplay_drag_phaseHandlers.
gameplay_drag_dragTypes_headsUpRace = {}

--- Builds the ranked list of results: each entry contains vehId, lane, time, isPlayable, disqualified. The smallest time wins, the disqualified come last.
---Source: lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:134
---@param dragData table Race data with racers.
---@return table[]  List of results, {} if no racers.
function gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData) end

--- Load hook: retrieves the references to core and phaseHandlers and resets the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:36
function gameplay_drag_dragTypes_headsUpRace.onExtensionLoaded() end

--- Per-frame hook, active only when the activity is started: simulates the local racers, calls the function of their phase, changes phase when it is completed (without dependency), marks the race as finished and handles the grouped phase advancement according to solo/host/client.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:61
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw) end

--- Stops the activity (hasActivityStarted = false).
---Source: lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:42
function gameplay_drag_dragTypes_headsUpRace.resetDragRace() end

--- Starts the activity: dragData.isStarted = true and sets a dial delay of 0 for each racer (phaseHandlers.setDialsData). Called by core.startDragRaceActivity.
---Source: lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:46
function gameplay_drag_dragTypes_headsUpRace.startActivity() end

