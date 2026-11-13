---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/missionInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_missionInfo` : `extensions.load("ui_missionInfo")`, puis la globale `ui_missionInfo`
---@class ui_missionInfo
---@field buttonsTable any
---@field openState any
ui_missionInfo = {}

---Source : lua/ge/extensions/ui/missionInfo.lua:82
function ui_missionInfo.closeDialogue() end

---Source : lua/ge/extensions/ui/missionInfo.lua:109
---@param routeEntry any
function ui_missionInfo.onAfterRouteChange(routeEntry) end

---Source : lua/ge/extensions/ui/missionInfo.lua:105
function ui_missionInfo.onInputBindingsChanged() end

---Source : lua/ge/extensions/ui/missionInfo.lua:58
---@param content any
function ui_missionInfo.openActivityAcceptDialogue(content) end

---Source : lua/ge/extensions/ui/missionInfo.lua:38
---@param content any
function ui_missionInfo.openDialogue(content) end

---Source : lua/ge/extensions/ui/missionInfo.lua:26
---@param actionName any
function ui_missionInfo.performAction(actionName) end

---Source : lua/ge/extensions/ui/missionInfo.lua:51
---@param id any
function ui_missionInfo.performActivityAction(id) end

---Source : lua/ge/extensions/ui/missionInfo.lua:96
---@param index any
function ui_missionInfo.setActivityIndexVisible(index) end

