---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension that manages the speed cameras and red light cameras placed in levels as BeamNGTrigger triggers carrying a speedTrapType field ("speed" or "redLight"). When a vehicle enters the trigger, in the right direction and too fast, it emits the hooks onSpeedTrapTriggered or onRedLightCamTriggered and makes the associated light flash. Inactive during a foreground mission.
--- Access: extension `gameplay_speedTraps`: `extensions.load("gameplay_speedTraps")`, then the global `gameplay_speedTraps`
---@class gameplay_speedTraps
gameplay_speedTraps = {}

--- Lists the BeamNGTrigger triggers of the current level whose speedTrapType matches.
---Source: lua/ge/extensions/gameplay/speedTraps.lua:105
---@param speedTrapType string 'speed' or 'redLight'.
---@return table[]  Trigger objects (empty table if none).
function gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType) end

--- Hook called by the engine on each BeamNGTrigger event. Only handles triggers with speedTrapType and the 'enter' event. Computes the vehicle speed, checks the direction of passage and emits onSpeedTrapTriggered(data, vehSpeed, overSpeed) or onRedLightCamTriggered(data, vehSpeed), then turns on the named light.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/speedTraps.lua:45
---@param data table Trigger data (see notes).
function gameplay_speedTraps.onBeamNGTrigger(data) end

