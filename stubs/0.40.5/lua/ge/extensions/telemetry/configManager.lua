---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/configManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_configManager` : `extensions.load("telemetry_configManager")`, puis la globale `telemetry_configManager`
---@class telemetry_configManager
---@field dependencies table
telemetry_configManager = {}

---Source : lua/ge/extensions/telemetry/configManager.lua:145
function telemetry_configManager.checkConfigExpiry() end

---Source : lua/ge/extensions/telemetry/configManager.lua:105
---@param callback any
function telemetry_configManager.fetchConfigFromAPI(callback) end

---Source : lua/ge/extensions/telemetry/configManager.lua:158
function telemetry_configManager.getConfig() end

---Source : lua/ge/extensions/telemetry/configManager.lua:162
---@param moduleName any
function telemetry_configManager.getModuleConfig(moduleName) end

--- Older cached configs used days. Keep reading them until every installation has fetched
---  the hours-based server format.
---Source : lua/ge/extensions/telemetry/configManager.lua:176
---@param moduleName any
---@param defaultHours any
function telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours) end

---Source : lua/ge/extensions/telemetry/configManager.lua:187
function telemetry_configManager.getTelemetryVersion() end

---Source : lua/ge/extensions/telemetry/configManager.lua:191
---@param callback any
function telemetry_configManager.initializeConfig(callback) end

--- -telemetryLocal: every tracker on with its defaults, the server is never asked and
---  nothing is uploaded
---Source : lua/ge/extensions/telemetry/configManager.lua:31
function telemetry_configManager.isLocalOnly() end

---Source : lua/ge/extensions/telemetry/configManager.lua:170
---@param moduleName any
function telemetry_configManager.isModuleEnabled(moduleName) end

---Source : lua/ge/extensions/telemetry/configManager.lua:241
function telemetry_configManager.onExtensionLoaded() end

---Source : lua/ge/extensions/telemetry/configManager.lua:230
---@param enabled any
function telemetry_configManager.setPollingEnabled(enabled) end

