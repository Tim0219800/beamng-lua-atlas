---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_appContainers` : `extensions.load("ui_appContainers")`, puis la globale `ui_appContainers`
---@class ui_appContainers
ui_appContainers = {}

---Source : lua/ge/extensions/ui/appContainers.lua:78
---@param containerId any
---@param appId any
function ui_appContainers.getAppVisibility(containerId, appId) end

---Source : lua/ge/extensions/ui/appContainers.lua:142
---@param containerId any
function ui_appContainers.getAvailableApps(containerId) end

---Source : lua/ge/extensions/ui/appContainers.lua:125
---@param containerId any
function ui_appContainers.getVisibleApps(containerId) end

---Source : lua/ge/extensions/ui/appContainers.lua:94
---@param containerId any
function ui_appContainers.hideAllApps(containerId) end

---Source : lua/ge/extensions/ui/appContainers.lua:117
---@param containerId any
---@param appId any
function ui_appContainers.hideApp(containerId, appId) end

---Source : lua/ge/extensions/ui/appContainers.lua:163
---@param data any
function ui_appContainers.onDeserialize(data) end

---Source : lua/ge/extensions/ui/appContainers.lua:186
function ui_appContainers.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/appContainers.lua:189
function ui_appContainers.onExtensionUnloaded() end

---Source : lua/ge/extensions/ui/appContainers.lua:152
function ui_appContainers.onSerialize() end

---Source : lua/ge/extensions/ui/appContainers.lua:193
function ui_appContainers.onUpdate() end

---Source : lua/ge/extensions/ui/appContainers.lua:35
---@param config any
function ui_appContainers.registerContainer(config) end

---Source : lua/ge/extensions/ui/appContainers.lua:18
---@param containerId any
function ui_appContainers.resolveContainerId(containerId) end

---Source : lua/ge/extensions/ui/appContainers.lua:56
---@param containerId any
---@param appId any
---@param visible any
function ui_appContainers.setAppVisibility(containerId, appId, visible) end

---Source : lua/ge/extensions/ui/appContainers.lua:178
---@param enabled any
function ui_appContainers.setDebug(enabled) end

---Source : lua/ge/extensions/ui/appContainers.lua:182
---@param enabled any
function ui_appContainers.setVerboseLogging(enabled) end

---Source : lua/ge/extensions/ui/appContainers.lua:113
---@param containerId any
---@param appId any
function ui_appContainers.showApp(containerId, appId) end

---Source : lua/ge/extensions/ui/appContainers.lua:121
---@param containerId any
---@param appId any
function ui_appContainers.toggleApp(containerId, appId) end

