---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePresencePolicy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pure (stateless) rules describing a player's "presence" relative to a vehicle: driver, passenger or unrestricted. Tells whether an input action map is allowed for a given mode and which unseated mode to use by default. No hook or state: it is used as a library.
--- Access: extension `gameplay_vehiclePresencePolicy`: `extensions.load("gameplay_vehiclePresencePolicy")`, then the global `gameplay_vehiclePresencePolicy`
---@class gameplay_vehiclePresencePolicy
gameplay_vehiclePresencePolicy = {}

--- Indicates whether an action map is allowed for the mode.
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:28
---@param mode string Presence mode.
---@param mapKind string Action map type (e.g. "driving", "slot").
---@return boolean
function gameplay_vehiclePresencePolicy.allowsActionMap(mode, mapKind) end

--- Default mode of an unseated player: "unrestricted" in freeroam (or without a mode) when multiseat is not active, "passenger" otherwise.
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:21
---@param context table|nil {mode = "freeroam"|"multiplayer"|"career"|..., isMultiseatActive = boolean}
---@return string  "unrestricted" or "passenger"
function gameplay_vehiclePresencePolicy.defaultUnseatedMode(context) end

--- Tests whether a value is a known mode.
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:13
---@param mode any Value to test.
---@return boolean  true for driver, passenger or unrestricted.
function gameplay_vehiclePresencePolicy.isValidMode(mode) end

--- Returns the mode if valid, otherwise the fallback mode if valid, otherwise "passenger".
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:17
---@param mode any Requested mode.
---@param fallback any Optional fallback mode.
---@return string  A valid mode.
function gameplay_vehiclePresencePolicy.normalizeMode(mode, fallback) end

