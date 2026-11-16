---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/lawnMower.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lawn mower driven by JBeam props (GE side only). It searches each vehicle's parsed JBeam for props with the mowerRadius option and, while the cutting deck is low and flat above terrain, cuts the grass in the shared surface mask (util_surfaceMaskWheels) by drawing a disc then segments, and spawns grass blade particles on terrain materials whose name contains "grass". No vehicle-side Lua is needed. The JBeam part declares "gameEngineExtensions": {"util_lawnMower": true} to load the extension automatically.
--- Access: extension `util_lawnMower`: `extensions.load("util_lawnMower")`, then the global `util_lawnMower`
---@class util_lawnMower
---@field dependencies string[] Required extensions: util_surfaceMaskWheels (mask service) and core_vehicle_manager (parsed JBeam data)
---@field enabled boolean Enables or disables cutting; true after onExtensionLoaded
util_lawnMower = {}

--- Hook called at level start: clears the caches of mown cells, grass materials and terrain object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:233
function util_lawnMower.onClientStartMission() end

--- Deserialization hook after reload: restores the enabled state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:264
---@param data table|nil Data returned by onSerialize
function util_lawnMower.onDeserialized(data) end

--- Called on load: enables the mower and scans the vehicles already present.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:244
function util_lawnMower.onExtensionLoaded() end

--- Hook called every frame before rendering: if enabled and mowers exist, centers the mask clipmap and makes each mower cut (every 0.05 s). Removes the state of vehicles that have disappeared.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:164
---@param dtReal number Real-time delta in seconds
---@param dtSim number Simulation time delta in seconds (takes priority for the timer)
function util_lawnMower.onPreRender(dtReal, dtSim) end

--- Serialization hook before an extension reload: saves the enabled state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:260
---@return table  {enabled = boolean}
function util_lawnMower.onSerialize() end

--- Hook called when a vehicle is destroyed: forgets its mowers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:239
---@param vehId integer Vehicle id
function util_lawnMower.onVehicleDestroyed(vehId) end

--- Hook called when a vehicle spawns (or respawned after a part change): rereads its JBeam props looking for mowerRadius.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/lawnMower.lua:229
---@param vehId integer Vehicle id
function util_lawnMower.onVehicleSpawned(vehId) end

--- Enables or disables cutting and resets the timer.
---Source: lua/ge/extensions/util/lawnMower.lua:251
---@param enabled boolean true to enable
function util_lawnMower.setEnabled(enabled) end

--- Toggles the enabled/disabled state.
---Source: lua/ge/extensions/util/lawnMower.lua:256
function util_lawnMower.toggle() end

