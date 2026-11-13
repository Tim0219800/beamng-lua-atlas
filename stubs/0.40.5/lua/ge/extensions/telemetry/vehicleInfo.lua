---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/vehicleInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_vehicleInfo` : `extensions.load("telemetry_vehicleInfo")`, puis la globale `telemetry_vehicleInfo`
---@class telemetry_vehicleInfo
telemetry_vehicleInfo = {}

--- Model and part config of a vehicle. A custom configuration reports as ":custom", so no
---  user built configuration ever leaves the machine.
---Source : lua/ge/extensions/telemetry/vehicleInfo.lua:14
---@param vid any
function telemetry_vehicleInfo.getData(vid) end

--- The mod a vehicle model comes from, nil for stock content. The mod manager can only
---  resolve zipped mods, an unpacked mod returns nil.
---Source : lua/ge/extensions/telemetry/vehicleInfo.lua:37
---@param model any
function telemetry_vehicleInfo.getMod(model) end

