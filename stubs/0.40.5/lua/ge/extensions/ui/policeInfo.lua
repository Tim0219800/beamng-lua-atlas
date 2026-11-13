---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/policeInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_policeInfo` : `extensions.load("ui_policeInfo")`, puis la globale `ui_policeInfo`
---@class ui_policeInfo
---@field enabled boolean
---@field showFinalStats boolean
---@field targetId any
ui_policeInfo = {}

---Source : lua/ge/extensions/ui/policeInfo.lua:40
function ui_policeInfo.isPursuit() end

---Source : lua/ge/extensions/ui/policeInfo.lua:154
---@param dt any
function ui_policeInfo.onGuiUpdate(dt) end

---Source : lua/ge/extensions/ui/policeInfo.lua:77
---@param vehId any
---@param action any
---@param data any
function ui_policeInfo.onPursuitAction(vehId, action, data) end

---Source : lua/ge/extensions/ui/policeInfo.lua:64
---@param vehId any
---@param name any
---@param data any
function ui_policeInfo.onPursuitOffense(vehId, name, data) end

---Source : lua/ge/extensions/ui/policeInfo.lua:144
function ui_policeInfo.onPursuitStatsEnded() end

---Source : lua/ge/extensions/ui/policeInfo.lua:150
function ui_policeInfo.onUiChangedState() end

---Source : lua/ge/extensions/ui/policeInfo.lua:58
---@param _ any
---@param id any
function ui_policeInfo.onVehicleSwitched(_, id) end

---Source : lua/ge/extensions/ui/policeInfo.lua:44
function ui_policeInfo.resetPursuitTable() end

