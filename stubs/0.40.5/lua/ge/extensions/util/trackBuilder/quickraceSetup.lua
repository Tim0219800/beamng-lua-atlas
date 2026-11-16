---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/quickraceSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Link extension between quick race mode (scenario) and the Track Builder: when a scenario is loaded, it unloads the tracks in place, loads the scenario's custom track (sc.track.customData.name) via util_trackBuilder_splineTrack, adds the checkpoints and positions the vehicle, optionally in the reverse direction.
--- Access: extension `util_trackBuilder_quickraceSetup`: `extensions.load("util_trackBuilder_quickraceSetup")`, then the global `util_trackBuilder_quickraceSetup`
---@class util_trackBuilder_quickraceSetup
util_trackBuilder_quickraceSetup = {}

--- Hook called at the start of a level load; resets the done flag to allow a new setup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/quickraceSetup.lua:23
function util_trackBuilder_quickraceSetup.onClientStartMission() end

--- Hook called when a scenario is loaded. If the setup is not already done: unloadAll, load of the scenario's track, addCheckPointPositions(reverse), positionVehicle(reverse).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/quickraceSetup.lua:10
---@param sc table Scenario; uses sc.track.customData.name (track name) and sc.track.reverse (reverse direction).
function util_trackBuilder_quickraceSetup.onScenarioLoaded(sc) end

