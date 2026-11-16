---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/configManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension (depends on telemetry_userIdentity) that manages the telemetry configuration: reading the /telemetry/config.json cache, validation, periodic fetching from the server (s11/v1/telemetryConfig, with the clientFacts facts and the anonymous identifier), then application via a callback. It indicates which modules/trackers are enabled (moduleConfigs). Starting with the -telemetryLocal argument enables all trackers with their default values without ever contacting the server or sending anything.
--- Access: extension `telemetry_configManager`: `extensions.load("telemetry_configManager")`, then the global `telemetry_configManager`
---@class telemetry_configManager
---@field dependencies string[] {'telemetry_userIdentity'}.
telemetry_configManager = {}

--- If the retry delay has elapsed and the config's TTL is exceeded, relaunches fetchConfigFromAPI and applies the new config. At most one attempt every 300 s.
---Source: lua/ge/extensions/telemetry/configManager.lua:145
function telemetry_configManager.checkConfigExpiry() end

--- Calls core_online.apiCall('s11/v1/telemetryConfig') sending the client facts and the anonymous identifier. If the response is valid, saves it to /telemetry/config.json and calls callback; otherwise, calls callback with a disabled default config (unless a config already exists).
---Source: lua/ge/extensions/telemetry/configManager.lua:105
---@param callback function|nil Called with the obtained configuration.
function telemetry_configManager.fetchConfigFromAPI(callback) end

--- Returns the currently applied configuration.
---Source: lua/ge/extensions/telemetry/configManager.lua:158
---@return table|nil  Config (enabled, ttlHours, reportIntervalHours, runIds, moduleConfigs) or nil before initializeConfig.
function telemetry_configManager.getConfig() end

--- Returns the configuration of a telemetry module: {enabled = true} in local mode, the moduleConfigs[moduleName] table if it exists, otherwise the shared table {enabled = false}.
---Source: lua/ge/extensions/telemetry/configManager.lua:162
---@param moduleName string Module/tracker name.
---@return table  Module config (do not modify it: it may be shared).
function telemetry_configManager.getModuleConfig(moduleName) end

--- Sampling interval of a module in hours: surveyIntervalHours, or surveyIntervalDays * 24 for old caches, otherwise the default value. Old caches in days are still read until all installations have picked up the hours format.
---Source: lua/ge/extensions/telemetry/configManager.lua:176
---@param moduleName string Module name.
---@param defaultHours number Value returned if nothing is configured.
---@return number  Interval in hours.
function telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours) end

--- Returns the telemetry schema version.
---Source: lua/ge/extensions/telemetry/configManager.lua:187
---@return string  Currently '30'.
function telemetry_configManager.getTelemetryVersion() end

--- Loads the configuration: in local mode, applies an enabled default config; otherwise enables polling, applies the cache if it is valid and recent, otherwise a disabled default config (the actual fetch happens after online authentication).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/configManager.lua:191
---@param callback function|nil Called with the config on each application (and stored for later updates).
function telemetry_configManager.initializeConfig(callback) end

--- Indicates whether the game was launched with -telemetryLocal: all trackers are active with their default values, the server is never queried and nothing is sent.
---Source: lua/ge/extensions/telemetry/configManager.lua:31
---@return boolean  true if the argument is present.
function telemetry_configManager.isLocalOnly() end

--- Indicates whether a module is enabled (getModuleConfig(...).enabled == true).
---Source: lua/ge/extensions/telemetry/configManager.lua:170
---@param moduleName string Module/tracker name.
---@return boolean  true if enabled.
function telemetry_configManager.isModuleEnabled(moduleName) end

--- Load hook: sets the extension to manual unload mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/configManager.lua:241
function telemetry_configManager.onExtensionLoaded() end

--- Enables or turns off polling: installs/removes the onUpdate hooks (expiry test every 60 s if the online session is authenticated) and onOnlineStateChanged (test as soon as connected), then calls extensions.hookUpdate.
---Source: lua/ge/extensions/telemetry/configManager.lua:230
---@param enabled boolean true to enable.
function telemetry_configManager.setPollingEnabled(enabled) end

