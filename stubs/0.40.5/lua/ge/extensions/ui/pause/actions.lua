---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/actions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_pause_actions` : `extensions.load("ui_pause_actions")`, puis la globale `ui_pause_actions`
---@class ui_pause_actions
ui_pause_actions = {}

---Source : lua/ge/extensions/ui/pause/actions.lua:24
function ui_pause_actions.clearActions() end

---Source : lua/ge/extensions/ui/pause/actions.lua:42
---@param buttonId any
---@param payload any
function ui_pause_actions.executeAction(buttonId, payload) end

---Source : lua/ge/extensions/ui/pause/actions.lua:50
function ui_pause_actions.getAllButtonInfos() end

--- shaped for buildPauseTabs
---Source : lua/ge/extensions/ui/pause/actions.lua:194
function ui_pause_actions.getVisibleModTabs() end

---Source : lua/ge/extensions/ui/pause/actions.lua:54
function ui_pause_actions.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/pause/actions.lua:34
function ui_pause_actions.onSaveFinished() end

---Source : lua/ge/extensions/ui/pause/actions.lua:46
---@param metadata any
---@param callback any
function ui_pause_actions.registerButton(metadata, callback) end

---Source : lua/ge/extensions/ui/pause/actions.lua:133
---@param button any
function ui_pause_actions.registerModButton(button) end

---Source : lua/ge/extensions/ui/pause/actions.lua:102
---@param tab any
function ui_pause_actions.registerModTab(tab) end

---Source : lua/ge/extensions/ui/pause/actions.lua:29
---@param callback any
function ui_pause_actions.saveCareerThen(callback) end

---Source : lua/ge/extensions/ui/pause/actions.lua:173
---@param id any
function ui_pause_actions.unregisterModButton(id) end

---Source : lua/ge/extensions/ui/pause/actions.lua:124
---@param id any
function ui_pause_actions.unregisterModTab(id) end

