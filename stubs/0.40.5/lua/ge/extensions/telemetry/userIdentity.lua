---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/userIdentity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the user's anonymous ID used by telemetry. A random "salt" is created once and stored in `/telemetry/salt.txt`; the ID is the SHA-256 hash of that file. An old `/gameTelemetries/.salt` file is migrated automatically to keep the same ID.
--- Access: extension `telemetry_userIdentity`: `extensions.load("telemetry_userIdentity")`, then the global `telemetry_userIdentity`
---@class telemetry_userIdentity
telemetry_userIdentity = {}

--- Returns the anonymous ID: the SHA-256 hash (`hashStringSHA256`) of the salt. Creates or migrates the salt file if needed (`telemetry` folder created as needed).
---Source: lua/ge/extensions/telemetry/userIdentity.lua:94
---@return string  SHA-256 hash of the salt file's contents.
function telemetry_userIdentity.getAnonymousUserID() end

--- Hook called when the extension loads. Sets the extension to manual unload to avoid its automatic unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/userIdentity.lua:101
function telemetry_userIdentity.onExtensionLoaded() end

