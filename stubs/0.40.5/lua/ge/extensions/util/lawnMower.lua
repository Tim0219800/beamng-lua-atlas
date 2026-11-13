---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/lawnMower.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_lawnMower` : `extensions.load("util_lawnMower")`, puis la globale `util_lawnMower`
---@class util_lawnMower
---@field dependencies table
---@field enabled boolean
util_lawnMower = {}

---Source : lua/ge/extensions/util/lawnMower.lua:233
function util_lawnMower.onClientStartMission() end

---Source : lua/ge/extensions/util/lawnMower.lua:264
---@param data any
function util_lawnMower.onDeserialized(data) end

---Source : lua/ge/extensions/util/lawnMower.lua:244
function util_lawnMower.onExtensionLoaded() end

---Source : lua/ge/extensions/util/lawnMower.lua:164
---@param dtReal any
---@param dtSim any
function util_lawnMower.onPreRender(dtReal, dtSim) end

---Source : lua/ge/extensions/util/lawnMower.lua:260
function util_lawnMower.onSerialize() end

---Source : lua/ge/extensions/util/lawnMower.lua:239
---@param vehId any
function util_lawnMower.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/util/lawnMower.lua:229
---@param vehId any
function util_lawnMower.onVehicleSpawned(vehId) end

---Source : lua/ge/extensions/util/lawnMower.lua:251
---@param enabled any
function util_lawnMower.setEnabled(enabled) end

---Source : lua/ge/extensions/util/lawnMower.lua:256
function util_lawnMower.toggle() end

