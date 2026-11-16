---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/vehicleInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilities shared by the telemetry trackers to describe a vehicle: model and configuration (`getData`) and originating mod (`getMod`). It is not a tracker itself, hence its place outside the `trackers` folder.
--- Access: extension `telemetry_vehicleInfo`: `extensions.load("telemetry_vehicleInfo")`, then the global `telemetry_vehicleInfo`
---@class telemetry_vehicleInfo
telemetry_vehicleInfo = {}

--- Returns the model (`vehicle.JBeam`) and configuration of a vehicle. The configuration is the file name without extension, or ":custom" if it is custom. Returns nil (with a warning in the log if the id is unknown) if the vehicle does not exist or is not a BeamNGVehicle.
---Source: lua/ge/extensions/telemetry/vehicleInfo.lua:14
---@param vid integer Vehicle object id.
---@return table|nil  `{model = string, config = string}` or nil.
function telemetry_vehicleInfo.getData(vid) end

--- Returns the mod a vehicle model comes from, via `core_modmanager.getModForFilename('/vehicles/<model>/info.json')`. Nil for base content, if the model is nil or if `core_modmanager` is absent.
---Source: lua/ge/extensions/telemetry/vehicleInfo.lua:37
---@param model string|nil Vehicle model name (folder under /vehicles).
---@return table|nil  `{name = string, modID = any}` (modID may be nil), or nil.
function telemetry_vehicleInfo.getMod(model) end

