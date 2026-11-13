---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/userIdentity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_userIdentity` : `extensions.load("telemetry_userIdentity")`, puis la globale `telemetry_userIdentity`
---@class telemetry_userIdentity
telemetry_userIdentity = {}

--- Creates an anonymous user ID by hashing the salt
---  This creates a unique identifier that can't be traced back to the user
---  Think of it like turning your secret code into a badge number
---Source : lua/ge/extensions/telemetry/userIdentity.lua:94
function telemetry_userIdentity.getAnonymousUserID() end

---Source : lua/ge/extensions/telemetry/userIdentity.lua:101
function telemetry_userIdentity.onExtensionLoaded() end

