---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/source.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_traffic_source` : `extensions.load("gameplay_traffic_source")`, puis la globale `gameplay_traffic_source`
---@class gameplay_traffic_source
gameplay_traffic_source = {}

---Source : lua/ge/extensions/gameplay/traffic/source.lua:34
---@param mode any
---@param data any
function gameplay_traffic_source.addSource(mode, data) end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:118
---@param defaultMode any
function gameplay_traffic_source.autoAddPlayers(defaultMode) end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:72
function gameplay_traffic_source.getSources() end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:167
---@param dt any
---@param dtSim any
function gameplay_traffic_source.onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:157
---@param vehId any
function gameplay_traffic_source.onVehicleResetted(vehId) end

--- split-screen often calls autoAddPlayers before anyone is seated; pick vehicles up when they appear
---Source : lua/ge/extensions/gameplay/traffic/source.lua:151
---@param oldId any
---@param newId any
---@param player any
function gameplay_traffic_source.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:65
---@param index any
function gameplay_traffic_source.removeSource(index) end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:17
function gameplay_traffic_source.resetSources() end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:76
---@param mode any
---@param options any
function gameplay_traffic_source.setSourceMode(mode, options) end

---Source : lua/ge/extensions/gameplay/traffic/source.lua:96
---@param index any
function gameplay_traffic_source.updateSource(index) end

