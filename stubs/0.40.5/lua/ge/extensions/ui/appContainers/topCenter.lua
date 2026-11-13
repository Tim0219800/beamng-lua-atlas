---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topCenter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_appContainers_topCenter` : `extensions.load("ui_appContainers_topCenter")`, puis la globale `ui_appContainers_topCenter`
---@class ui_appContainers_topCenter
---@field dependencies table
ui_appContainers_topCenter = {}

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:183
function ui_appContainers_topCenter.clearAllFlashMessages() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:166
---@param source any
function ui_appContainers_topCenter.clearMessagesFromSource(source) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:60
function ui_appContainers_topCenter.clearSpeedTarget() end

--- Used by the hud app to catch up on a message that was sent before it mounted.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:200
function ui_appContainers_topCenter.getActiveFlashMessage() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:27
---@param containerId any
---@param appId any
function ui_appContainers_topCenter.getAppVisibility(containerId, appId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:64
---@param containerId any
function ui_appContainers_topCenter.getAvailableApps(containerId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:64
---@param containerId any
function ui_appContainers_topCenter.getAvailableContexts(containerId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:87
---@param containerId any
function ui_appContainers_topCenter.getContainerContext(containerId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:56
function ui_appContainers_topCenter.getSpeedTarget() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:47
---@param containerId any
function ui_appContainers_topCenter.getVisibleApps(containerId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:31
---@param containerId any
function ui_appContainers_topCenter.hideAllApps(containerId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:39
---@param containerId any
---@param appId any
function ui_appContainers_topCenter.hideApp(containerId, appId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:267
function ui_appContainers_topCenter.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:285
function ui_appContainers_topCenter.onExtensionUnloaded() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:206
---@param data any
function ui_appContainers_topCenter.onGameplayFlashMessage(data) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:103
---@param data any
function ui_appContainers_topCenter.onScenarioFlashMessage(data) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:130
function ui_appContainers_topCenter.onScenarioFlashMessageClear() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:134
function ui_appContainers_topCenter.onScenarioNotRunning() end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:229
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:80
---@param containerId any
function ui_appContainers_topCenter.resetContainerContext(containerId) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:23
---@param containerId any
---@param appId any
---@param visible any
function ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:68
---@param containerId any
---@param context any
function ui_appContainers_topCenter.setContainerContext(containerId, context) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:95
---@param enabled any
function ui_appContainers_topCenter.setDebug(enabled) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:51
---@param data any
function ui_appContainers_topCenter.setSpeedTarget(data) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:99
---@param enabled any
function ui_appContainers_topCenter.setVerboseLogging(enabled) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:35
---@param containerId any
---@param appId any
function ui_appContainers_topCenter.showApp(containerId, appId) end

--- Shows a single flash message and remembers it for the duration of its ttl. So that even if the hud app mounts late, it will show
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:191
---@param msg any
---@param ttl any
---@param big any
function ui_appContainers_topCenter.showFlashMessage(msg, ttl, big) end

---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:43
---@param containerId any
---@param appId any
function ui_appContainers_topCenter.toggleApp(containerId, appId) end

