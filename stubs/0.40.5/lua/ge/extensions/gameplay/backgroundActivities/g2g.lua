---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/backgroundActivities/g2g.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "g2g" background activity: on activation, fade to black, spawn of a random vehicle (car or truck with Top Speed > 10), then fade from black, all via util_stepHandler. On deactivation, the created vehicles are deleted. getVehicleOptions builds (and caches) the list of candidate models and configs from core_vehicles.getVehicleList().
--- Access: extension `gameplay_backgroundActivities_g2g`: `extensions.load("gameplay_backgroundActivities_g2g")`, then the global `gameplay_backgroundActivities_g2g`
---@class gameplay_backgroundActivities_g2g
---@field dependencies table<integer, string> Extensions loaded before: {"util_stepHandler"}.
gameplay_backgroundActivities_g2g = {}

--- Activates the activity: no effect if already active. Launches a sequence of steps (fade to black, spawn of a random vehicle among getVehicleOptions, fade from black) that calls activateFinished at the end. The ids of the created vehicles are stored.
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:13
function gameplay_backgroundActivities_g2g.activate() end

--- End callback of the activation sequence: logs and forces active = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:30
function gameplay_backgroundActivities_g2g.activateFinished() end

--- Deletes the created vehicles (notifies the editor if present, then obj:delete()) and empties the id list. No effect if the activity is not active.
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:35
function gameplay_backgroundActivities_g2g.deactivate() end

--- Returns (and caches) the list of candidate vehicles: models of type Car or Truck, excluding buses and auxiliaries, with at least one config whose Top Speed > 10 and that is not auxiliary.
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:89
---@return table<integer, {model: string, configs: table[], paints: string[]}>  Each entry: model key, configs {config, name} and paint names.
function gameplay_backgroundActivities_g2g.getVehicleOptions() end

--- Tells whether the activity is active.
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:70
---@return boolean|nil  true if active; nil as long as it has never been activated.
function gameplay_backgroundActivities_g2g.isActive() end

--- Hook called when career mode changes state; deactivates the activity if career becomes active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:81
---@param enabled boolean true if career is enabled.
function gameplay_backgroundActivities_g2g.onCareerActive(enabled) end

--- Hook called at the end of a level: deactivates the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:62
function gameplay_backgroundActivities_g2g.onClientEndMission() end

--- Hook called after the extensions reload: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:78
function gameplay_backgroundActivities_g2g.onDeserialized() end

--- Hook called before the extensions reload: deactivates the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:74
function gameplay_backgroundActivities_g2g.onSerialize() end

--- Update hook: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:59
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when the controlled vehicle changes: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:66
function gameplay_backgroundActivities_g2g.onVehicleSwitched() end

--- Deactivates the activity if it is active, otherwise activates it.
---Source: lua/ge/extensions/gameplay/backgroundActivities/g2g.lua:50
function gameplay_backgroundActivities_g2g.toggleActive() end

