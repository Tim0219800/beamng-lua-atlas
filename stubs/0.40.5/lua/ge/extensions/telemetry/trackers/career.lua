---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career mode telemetry tracker: measures how long a career is played (activity "careerActive" with the save state at opening: money, beamXP, vouchers, vehicle count, new save, tutorial) and records the vehicles bought (vehicleAddedToInventory) and sold (vehicleSold). It goes through telemetry_core.startActivity/endActivity/addEvent.
--- Access: extension `telemetry_trackers_career`: `extensions.load("telemetry_trackers_career")`, then the global `telemetry_trackers_career`
---@class telemetry_trackers_career
---@field dependencies string[] telemetry_core.
telemetry_trackers_career = {}

--- Hook called before a vehicle is sold: records model, name and sale price.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/career.lua:56
---@param data table Contains inventoryId and price.
function telemetry_trackers_career.onBeforeVehicleSell(data) end

--- Hook called when the career becomes active or inactive: starts or ends the careerActive activity (with the player's attributes at start).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/career.lua:24
---@param active boolean true if the career is starting.
---@param newSave boolean true if it is a new save.
function telemetry_trackers_career.onCareerActive(active, newSave) end

--- Hook called on load: sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/career.lua:70
function telemetry_trackers_career.onExtensionLoaded() end

--- Hook called on unload: a Lua reload destroys the trackers without onExit, so the career activity is also closed here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/career.lua:18
function telemetry_trackers_career.onExtensionUnloaded() end

--- Hook called when a vehicle is added to the inventory: records model, name and purchase price.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/career.lua:42
---@param data table Contains vehicleInfo (model_key, Name) and purchaseData (prices).
function telemetry_trackers_career.onVehicleAddedToInventory(data) end

