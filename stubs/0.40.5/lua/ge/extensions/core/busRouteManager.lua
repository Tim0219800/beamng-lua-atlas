---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/busRouteManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension (core_busRouteManager) that manages the bus lines of a level. When the extension loads and when a level starts (init), it reads the *.buslines.json files from the level folder (/buslines/), checks that the referenced stops exist as BeamNGTrigger triggers of type 'busstop' in the 'busstops' group, and replaces stop names with their position data. It then relays trigger events to the bus controller (vehicle side) and to the scenario_busdriver scenario.
--- Access: extension `core_busRouteManager`: `extensions.load("core_busRouteManager")`, then the global `core_busRouteManager`
---@class core_busRouteManager
core_busRouteManager = {}

--- Called when a bus enters a stop: sends bus_onAtStop to vehicle data.subjectID.
---Source: lua/ge/extensions/core/busRouteManager.lua:96
---@param data table Trigger data (subjectID, type, event...)
function core_busRouteManager.onAtStop(data) end

--- Hook called by the engine for each trigger event. Only handles type == 'busstop': 'enter' -> onAtStop, 'exit' -> bus_onDepartedStop, 'tick' -> bus_onTriggerTick sent to the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/busRouteManager.lua:107
---@param data table {type, event ('enter'|'exit'|'tick'), subjectID, ...}
function core_busRouteManager.onBeamNGTrigger(data) end

--- Bus update hook: forwards the state to scenario_busdriver.onBusUpdate if that scenario is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/busRouteManager.lua:119
---@param state table Bus state (inferred from code: notably contains pos)
function core_busRouteManager.onBusUpdate(state) end

--- Hook called when a level starts: (re)initializes busLines and reloads the level's line files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/busRouteManager.lua:73
function core_busRouteManager.onClientStartMission() end

--- Hook called when the extension loads: same init function as onClientStartMission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/busRouteManager.lua:73
function core_busRouteManager.onExtensionLoaded() end

--- Looks for the route whose routeID and variance match. If vehId is given, sends the line info to the vehicle (command bus_setLineInfo). Returns the route found or nil (with an error log).
---Source: lua/ge/extensions/core/busRouteManager.lua:83
---@param vehId integer|nil ID of the bus vehicle to configure (getObjectByID), nil to only search
---@param routeID any Line identifier (compared with ==)
---@param variance any Line variant (e.g. 'a')
---@return table|nil  Route table (with transformed tasklist), nil if not found
function core_busRouteManager.setLine(vehId, routeID, variance) end

