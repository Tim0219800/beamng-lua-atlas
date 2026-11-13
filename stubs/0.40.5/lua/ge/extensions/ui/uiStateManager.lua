---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiStateManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_uiStateManager` : `extensions.load("ui_uiStateManager")`, puis la globale `ui_uiStateManager`
---@class ui_uiStateManager
---@field dependencies table
ui_uiStateManager = {}

---Source : lua/ge/extensions/ui/uiStateManager.lua:110
function ui_uiStateManager._checkAllUiReady() end

---Source : lua/ge/extensions/ui/uiStateManager.lua:53
---@param uiType any
function ui_uiStateManager.checkAndSyncRoute(uiType) end

--- Public API
---Source : lua/ge/extensions/ui/uiStateManager.lua:15
---@param headlessMode any
function ui_uiStateManager.initialize(headlessMode) end

---Source : lua/ge/extensions/ui/uiStateManager.lua:39
---@param uiType any
function ui_uiStateManager.isUiReady(uiType) end

--- Initial navigation
---Source : lua/ge/extensions/ui/uiStateManager.lua:86
function ui_uiStateManager.navigateToInitialScreen() end

---Source : lua/ge/extensions/ui/uiStateManager.lua:78
function ui_uiStateManager.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/uiStateManager.lua:23
---@param uiType any
function ui_uiStateManager.uiReady(uiType) end

